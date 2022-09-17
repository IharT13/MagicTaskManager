import UIKit

final class MainTabBarController: UITabBarController {
    
    private var todoS = [ToDo]()
    
    private let toDoVC = UINavigationController(rootViewController: TodoViewController())
    private let notesTableViewVC = UINavigationController(rootViewController: NotesTableViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.shared.getData { todo in
            self.todoS = todo
            print(self.todoS)
        }
    }
}
