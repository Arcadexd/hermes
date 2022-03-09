import Apollo

typealias SearchResult = (Result<RepositorySearchResult, Error>) -> Void

final class ViewModel {
    private let client: GraphQLClient
    private var repositorySearchResult: RepositorySearchResult?
    
    init(client: GraphQLClient = ApolloClient.shared) {
        self.client = client
    }
    
    func search(phrase: String, and completion: @escaping SearchResult) {
        /*
         example search of a given phrase, using default searching parameters
         */
        
        self.client.searchRepositories(mentioning: phrase) { response in
            switch response {
            case let .success(results):
                self.repositorySearchResult = RepositorySearchResult(pageInfo: results.pageInfo, repos: results.repos)
                
                completion(.success(results))
                
                let pageInfo = results.pageInfo
                print("pageInfo: \n")
                print("hasNextPage: \(pageInfo.hasNextPage)")
                print("hasPreviousPage: \(pageInfo.hasPreviousPage)")
                print("startCursor: \(String(describing: pageInfo.startCursor))")
                print("endCursor: \(String(describing: pageInfo.endCursor))")
                print("\n")
                
                results.repos.forEach { repository in
                    print("Name: \(repository.name)")
                    print("Path: \(repository.url)")
                    print("Owner: \(repository.owner.login)")
                    print("avatar: \(repository.owner.avatarUrl)")
                    print("Stars: \(repository.stargazers.totalCount)")
                    print("\n")
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getGenericCellModel(index: Int) -> GenericCellModel {
        let repo = repositorySearchResult?.repos[index]
        let genericCellModel = GenericCellModel(title: repo?.name, subTitle: repo?.owner.login, content: repo?.url, imageUrl: repo?.owner.avatarUrl, value: repo?.stargazers.totalCount ?? 0)
        return genericCellModel
    }
    
    func getPathUrl(index: Int) -> String {
        let repo = repositorySearchResult?.repos[index]
        return repo?.url ?? ""
    }
    
    func numberOfRows() -> Int {
        return repositorySearchResult?.repos.count ?? 0
    }
}
