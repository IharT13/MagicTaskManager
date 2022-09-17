import UIKit

final class TodoViewController: UITableViewController {
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let todoSearchController = UISearchController()

    private var todoArray = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var filteredArray = [ToDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func addSetupTableView() {
        
    }
}
