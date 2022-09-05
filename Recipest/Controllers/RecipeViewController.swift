//
//  RecipeViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class RecipeViewController: UIViewController {

    var recipe : Recipe!
    


    
    @IBOutlet var ingredientsTableView: UITableView!
    
    @IBOutlet var methodTableView: UITableView!
    
    @IBOutlet var blurVisualEffectView: UIVisualEffectView!
    
    @IBOutlet var timeImageView: UIImageView!
    
    @IBOutlet var servingsImageView: UIImageView!
    
    @IBOutlet var recipeNameLabel: UILabel!
    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var recipeCookinhTimeLabel: UILabel!
    @IBOutlet var recipeServingsLabel: UILabel!
    @IBOutlet var recipeDifficultyLabel: UILabel!
    @IBOutlet var recipeCuisineLabel: UILabel!
    @IBOutlet var recipeCategoryLabel: UILabel!
    
    @IBOutlet var heightIngredientsTableView: NSLayoutConstraint!
    @IBOutlet var heightMethodTableView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupTableVIews()

        navigationItem.title = recipe.name
        
    }
    
    private func setupTableVIews() {
        heightMethodTableView.constant = CGFloat(recipe.method.capacity * 70)
        heightIngredientsTableView.constant = CGFloat(recipe.ingredients.count * 60)
        
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        ingredientsTableView.separatorStyle = .none
        ingredientsTableView.allowsSelection = false
        ingredientsTableView.isScrollEnabled = false
        
        methodTableView.delegate = self
        methodTableView.dataSource = self
        methodTableView.separatorStyle = .none
        methodTableView.allowsSelection = false
 //       methodTableView.isScrollEnabled = false
    }
    
    private func setupInterface() {
        recipeNameLabel.text = recipe.name
        recipeImage.image = UIImage(named: recipe.image)
        
        recipeCookinhTimeLabel.text = "\(recipe.cookingTime) мин"
        recipeCookinhTimeLabel.textColor = .white
        
        recipeServingsLabel.text = "\(recipe.servingsMin) - \(recipe.servingsMax)"
        recipeServingsLabel.textColor = .white

        recipeCuisineLabel.text = recipe.cuisine.rawValue
        recipeCategoryLabel.text = recipe.category.rawValue
        
        recipeDifficultyLabel.text = recipe.difficulty
        
    }

  

}
//MARK: - TableView Methods
extension RecipeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case ingredientsTableView:
            let ingredientsCount = recipe.ingredients.count
            return ingredientsCount
            default:
            let methodsCount = 1 /*recipe.method.count */
            return methodsCount
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfSection: Int = 0
        if tableView == methodTableView {
            numberOfSection = recipe.method.count
        }
        if tableView == ingredientsTableView {
            numberOfSection = 1
        }
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == methodTableView {
            return "Шаг \(recipe.method[section].numberOfStep):"
        }
        if tableView == ingredientsTableView {
            return ""
        }
        return ""
    }
          
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if tableView == ingredientsTableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: K.iCell, for: indexPath)
                let ingredients = recipe.ingredients[indexPath.row]
                var content = cell.defaultContentConfiguration()
                content.image = UIImage(systemName: "plus.square")
                content.imageProperties.maximumSize.height = CGFloat(20)
                content.imageProperties.maximumSize.width = CGFloat(20)
                content.text = ingredients.ingredient
                content.secondaryText = ingredients.count
                
                cell.contentConfiguration = content
                cell.selectionStyle = .none
                return cell
            }
            if tableView == methodTableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: K.mCell, for: indexPath)
                let methods = recipe.method[indexPath.section]
                var content = cell.defaultContentConfiguration()
                content.text = methods.description
                content.image = UIImage(systemName: "tuningfork")
                content.imageProperties.maximumSize.height = CGFloat(20)
                content.imageProperties.maximumSize.width = CGFloat(20)
                
                cell.contentConfiguration = content
                cell.selectionStyle = .none
                return cell
            }

        return UITableViewCell()
    }

}
