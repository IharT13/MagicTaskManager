import UIKit
import SwiftUI

final class MainTabBarController: UITabBarController {
    
    private let toDoVC = UINavigationController(rootViewController: TodoViewController())
    private let notesTableViewVC = UINavigationController(rootViewController: NotesTableViewController())
    private let personSettingsSwiftUIView = UIHostingController(rootView: PersonSettingSwiftUIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSetups()
    }
    
    private func addSetups() {
        addControllersToTabBar()
        setupUI()
        addTabBarTitles()
    }
    
    private func addControllersToTabBar() {
        setViewControllers([toDoVC, notesTableViewVC, personSettingsSwiftUIView], animated: true)
    }
    
    private func setupUI() {
        toDoVC.tabBarItem.image = UIImage(systemName: "note.text")
        notesTableViewVC.tabBarItem.image = UIImage(systemName: "list.bullet")
        personSettingsSwiftUIView.tabBarItem.image = UIImage(systemName: "gear")
        
        tabBar.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.tintColor = .orange
    }
    
    private func addTabBarTitles() {
        toDoVC.title = "Заметки"
        notesTableViewVC.title = "Задачи"
        personSettingsSwiftUIView.title = "Настройки"
    }
    
    
}
