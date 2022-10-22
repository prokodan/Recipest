//
//  CategoriesTableViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    //MARK: - Public Properties
    var data: [DataBase] = []
    
    //MARK: - VC Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        data[section].name.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].recipe.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cell, for: indexPath)
        let recipe = getRecipe(indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: recipe.image)
        content.text = recipe.name
        content.textProperties.adjustsFontSizeToFitWidth = true
        content.secondaryText = recipe.description
        
        content.image = UIImage(named: recipe.image)
        content.imageProperties.maximumSize.height = CGFloat(80)
        content.imageProperties.maximumSize.width = CGFloat(80)
        content.imageProperties.cornerRadius = CGFloat(8)
        
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none

        return cell
    }
  
    //MARK: - Private Methods
    private func getRecipe(_ indexPath: IndexPath) -> Recipe {
        let recipeOfCategory = data[indexPath.section].recipe[indexPath.row]
        return recipeOfCategory
    }
    
    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let indexPath = tableView.indexPathForSelectedRow else {return}
         guard let recipeVC = segue.destination as? RecipeViewController else {return}
         recipeVC.recipe = data[indexPath.section].recipe[indexPath.row]
     }
    
}
