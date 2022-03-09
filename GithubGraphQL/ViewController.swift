import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.search(phrase: "graphql")
    }
    
    func setupTableView() {
        registerCell()
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func registerCell() {
        tableView.register(cellType: GenericCell.self)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: GenericCell.self, forIndexPath: indexPath)
        cell.viewModel = GenericCellViewModel()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
