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
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var toRecipiesButton: UIButton!
    @IBOutlet var authorBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        backgroundImageView.image = UIImage(named: K.backgroundPicture)
        numberOfRecipesLabel.font = UIFont(name: K.mainSystemFont, size: 35)
        numberOfRecipesLabel.text = refreshNumberOfRecepies()
        toRecipiesButton.titleLabel?.font = UIFont(name: K.mainSystemFont, size: 35)
        authorBarButtonItem.tintColor = UIColor(named: ColorSets.mainSysColor.rawValue)
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
            case 1, 21, 31, 41, 51, 61, 71, 81, 91, 101:
                compositeLabel += " и \(numberOfRecipies) рецепт"
        case 1..<5, 21..<25, 31..<35, 41..<45, 51..<55, 61..<65, 71..<75, 81..<85, 91..<95, 101..<105:
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
                } else if let recipesVC = viewController as? RecipesTableViewController {
                    recipesVC.recipe = recipe
                }
            
            }
        }
    }
}

