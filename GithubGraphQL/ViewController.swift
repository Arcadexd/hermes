import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
    super.viewDidLoad()

    viewModel.search(phrase: "graphql")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
      
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
