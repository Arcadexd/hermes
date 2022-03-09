import Apollo

typealias SearchResult = (Result<RepositorySearchResult, Error>) -> Void

final class ViewModel {
    private let client: GraphQLClient
    private var repositorySearchResult: RepositorySearchResult?
    private var repositories = [RepositoryDetails]()
    private var isPaginating = false
    
    init(client: GraphQLClient = ApolloClient.shared) {
        self.client = client
    }
    
    func search(phrase: String, filter: SearchRepositoriesQuery.Filter? = nil, and completion: @escaping SearchResult) {
    
        self.client.searchRepositories(mentioning: phrase) { response in
            switch response {
            case let .success(results):
                self.repositorySearchResult = RepositorySearchResult(pageInfo: results.pageInfo, repos: results.repos)
                self.repositories.append(contentsOf: results.repos)
                
                completion(.success(results))
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getGenericCellModel(index: Int) -> GenericCellModel {
        let repo = repositories[index]
        let genericCellModel = GenericCellModel(title: repo.name, subTitle: repo.owner.login, content: repo.url, imageUrl: repo.owner.avatarUrl, value: repo.stargazers.totalCount )
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
