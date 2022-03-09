import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        fetchSearch(pagination: false)
    }
    
    func setupTableView() {
        registerCell()
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func registerCell() {
        tableView.register(cellType: GenericCell.self)
    }
    
    func fetchSearch(pagination: Bool) {
        let filter = SearchRepositoriesQuery.Filter.before(nil)
        
        viewModel.search(phrase: "graphql", filter: pagination ? filter : nil) { [weak self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: GenericCell.self, forIndexPath: indexPath)
        
        let cellModel = viewModel.getGenericCellModel(index: indexPath.row)
        cell.viewModel = GenericCellViewModel(model: cellModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webController = WebController()
        webController.url = viewModel.getPathUrl(index: indexPath.row)
        present(webController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == viewModel.numberOfRows() - 1 {
//            fetchSearch(pagination: true)
//        }
//        print(indexPath.row)
    }
}
