//
//  RecipesTableViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class RecipesTableViewController: UITableViewController {

    var recipe: [Recipe]!
    var searchData: [Recipe]!
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchData = recipe
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cell, for: indexPath)
        let recipe = searchData[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: recipe.image)
        content.text = recipe.name
        content.textProperties.adjustsFontSizeToFitWidth = true
        content.imageToTextPadding = CGFloat(8)
        content.secondaryText = recipe.description
        content.image = UIImage(named: recipe.image)
        content.imageProperties.maximumSize.height = CGFloat(140)
        content.imageProperties.maximumSize.width = CGFloat(140)
        content.imageProperties.cornerRadius = CGFloat(8)
        
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let recipeVC = segue.destination as? RecipeViewController else {return}
        recipeVC.recipe = searchData[indexPath.row]
    }
}

//MARK: - SearchBar Methods
extension RecipesTableViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = []
        
        if searchText == "" {
            searchData = recipe
            self.tableView.reloadData()
        } else {
            for sRecipe in recipe {
                var recipiesArray: [Recipe] = []
                if sRecipe.name.lowercased().contains(searchText.lowercased()) {
                    recipiesArray.append(sRecipe)
                }
                if !recipiesArray.isEmpty {
                    searchData.append(contentsOf: recipiesArray)
                }
            }
            self.tableView.reloadData()
        }
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        self.tableView.reloadData()
    }
    
    
    
}
