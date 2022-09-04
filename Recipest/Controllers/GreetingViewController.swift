//
//  ViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

protocol getRecipeProtocol {
    func getRecipies(for data: [DataBase]) -> [Recipe]
}
class GreetingViewController: UIViewController, getRecipeProtocol {

    
    
    var author = Author.getAuthorName()
    var dataManager = DataManager.shared
    lazy var recipe: [Recipe] = getRecipies(for: dataManager)
    
    @IBOutlet var numberOfRecipesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfRecipesLabel.text = refreshNumberOfRecepies()
    }

    @IBAction func toRecipesButtonTapped(_ sender: UIButton) {
    }
    @IBAction func authorBarButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    internal func getRecipies(for data: [DataBase]) -> [Recipe] {

        var recipies: [Recipe] = []
        let iterCount = data.count
        
        for sData in data[0..<iterCount].flatMap({ $0.recipe}) {
            recipies.append(sData)
        }
        return recipies
    }
    
    private func refreshNumberOfRecepies() -> String {
        let numberOfCategories = dataManager.count
        let numberOfRecipies = recipe.count
        var compositeLabel: String = ""
        
        switch numberOfCategories {
            case 1:
                compositeLabel = "В библиотеке \(numberOfCategories) категория блюд"
        case 1..<5:
                compositeLabel = "В библиотеке \(numberOfCategories) категории блюд"
        default:
                compositeLabel = "В библиотеке \(numberOfCategories) категорий блюд"
        }
        
        switch numberOfRecipies {
            case 1:
                compositeLabel += " и \(numberOfRecipies) рецепт"
            case 1..<5:
                compositeLabel += " и \(numberOfRecipies) рецепта"
            default:
                compositeLabel += " и \(numberOfRecipies) рецептов"
        }
        return compositeLabel
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
                    categoriesVC.recipe = recipe
                } else if let recipesVC = viewController as? RecipesTableViewController {
                    recipesVC.data = dataManager
                    recipesVC.recipe = recipe
                }
            
            }
        }
    }
    
    
}

