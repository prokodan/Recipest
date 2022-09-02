//
//  RecipesTableViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class RecipesTableViewController: UITableViewController, getContactProtocol {

    var data: [DataBase] = []
    lazy var recipe: [Recipe] = getRecipies(for: data)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    internal func getRecipies(for data: [DataBase]) -> [Recipe] {

        var recipies: [Recipe] = []
        let iterCount = data.count
        
        for sData in data[0..<iterCount].flatMap({ $0.recipe}) {
            recipies.append(sData)
        }
        return recipies
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipe.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cell, for: indexPath)
        let recipe = recipe[indexPath.row]
        
        
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
