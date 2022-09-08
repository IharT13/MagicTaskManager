import UIKit

final class MainTabBarController: UITabBarController {
    
    private let toDoVC = UINavigationController(rootViewController: TodoViewController())
    private let notesTableViewVC = UINavigationController(rootViewController: NotesTableViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
