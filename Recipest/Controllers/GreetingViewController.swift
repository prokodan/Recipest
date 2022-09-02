//
//  ViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

protocol getContactProtocol {
    func getRecipies(for data: [DataBase]) -> [Recipe]
}
class GreetingViewController: UIViewController {

    
    
    var author = Author.getAuthorName()
    var dataManager = DataManager.shared
    
    
    @IBOutlet var numberOfRecipesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshNumberOfRecepies()
    }

    @IBAction func toRecipesButtonTapped(_ sender: UIButton) {
    }
    @IBAction func authorBarButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    
    private func refreshNumberOfRecepies() {
        if dataManager.count == 1 {
            numberOfRecipesLabel.text = "В библиотеке \(dataManager.count) категория блюд"
        } else if dataManager.count > 1 && dataManager.count < 5 {
            numberOfRecipesLabel.text = "В библиотеке \(dataManager.count) категории блюд"
        } else {
        numberOfRecipesLabel.text = "В библиотеке \(dataManager.count) категорий блюд"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "toAuthor":
            guard let authorVC = segue.destination as? AuthorViewController else {return}
            authorVC.author = author
        default :
            guard let tabBarVC = segue.destination as? TabBarViewController else {return}
            for viewController in tabBarVC.viewControllers! {
                if let categoriesVC = viewController as? CategoriesTableViewController {
                    categoriesVC.data = dataManager
                } else if let recipesVC = viewController as? RecipesTableViewController {
                    recipesVC.data = dataManager
                }
            
            }
        }
    }
    
    
}

