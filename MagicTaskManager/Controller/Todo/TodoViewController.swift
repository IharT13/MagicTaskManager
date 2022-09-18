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
        addSetups()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    private func getData() {
        NetworkingManager.shared.getData { todo in
            self.todoArray = todo
        }
    }
    
    private func addSetups() {
        addSearchControllerSetups()
        addSetupTableView()
        view.backgroundColor = .white
        title = "Задачи"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addSetupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = AppColor.redColor
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
        tableView.rowHeight = 170
        tableView.separatorStyle = .none
        
    }
    
    private func addSearchControllerSetups() {
        todoSearchController.loadViewIfNeeded()
        todoSearchController.searchResultsUpdater = self
        todoSearchController.obscuresBackgroundDuringPresentation = false
        todoSearchController.searchBar.enablesReturnKeyAutomatically = false
        todoSearchController.searchBar.returnKeyType = UIReturnKeyType.done
        todoSearchController.searchBar.searchTextField.leftView?.tintColor = AppColor.orangeColor
        definesPresentationContext = true
        
        navigationItem.searchController = todoSearchController
        navigationItem.hidesSearchBarWhenScrolling = false
        todoSearchController.searchBar.scopeButtonTitles = ["Все", "Выполненые", "Невыполненые"]
        todoSearchController.searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todoSearchController.isActive {
            return filteredArray.count
        }
        return todoArray.prefix(15).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as? ToDoTableViewCell {
            
            let todo = (todoSearchController.isActive) ? filteredArray[indexPath.row] : todoArray[indexPath.row]
            cell.todoStackView.set(todo.title, todo.completed)
            
            return cell
        }
        return UITableViewCell()
    }
}


extension TodoViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton : String = "Все")
    {
        var isDone: Bool = false
        
        if scopeButton == "Выполненые" {
            isDone = true
        } else if scopeButton == "Невыполненые" {
            isDone = false
        }
        filteredArray = todoArray.filter
        {
            todo in
            let scopeMatch = (scopeButton == "Все" || todo.completed == isDone)
            if todoSearchController.searchBar.text != ""
            {
                let searchTextMatch = todo.title.hasPrefix(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        tableView.reloadData()
    }
}

