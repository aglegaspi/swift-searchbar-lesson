//
//  personTVC.swift
//  warmupDisplayPerson
//
//  Created by Alexander George Legaspi on 8/15/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

//create an app using a UITableViewController that displays each Person in Person.allPeople in a cell.

//You can use a subtitle cell rather than creating a custom UITableViewCell.

//Implement the data source methods for numberOfRows and cellForRow using this data. (edited)

import UIKit

class PersonTVController: UITableViewController {
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    let persons = Person.allPeople
    var didLaunch = Bool()
    
    var personSearchResults: [Person] {
        get {
            
            guard let searchString = searchString else {
                return persons
            }
            guard searchString != "" else {
                return persons
            }
            
            if let scopeTitles = searchBarOutlet.scopeButtonTitles {
                let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
                
                switch scopeTitles[currentScopeIndex] {
                case "Name":
                    return persons.filter{ $0.name.contains(searchString.lowercased()) }
                case "Phone":
                    return persons.filter{ $0.phone.contains(searchString.lowercased()) }
                default:
                    return persons
                }
            }
            return persons
        }
    }
    
    
    var searchString: String? = nil {
        didSet {
            print(searchString)
            self.tableView.reloadData()
        }
        // call a function on the tableView to reload it's data
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarOutlet.delegate = self
        // this allows the delegate methods to update the Table View Controller
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personSearchResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // we are seeing we can use this TVCell as this Type then do everything in the code block.
        if let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? PersonTVCell {
            
            cell.personName.text = personSearchResults[indexPath.row].name
            cell.personLocation.text = personSearchResults[indexPath.row].phone
            
            return cell
            
        } else {
            return UITableViewCell()
        }
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



extension PersonTVController: UISearchBarDelegate {
    
    //func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
    //print("hey you clicked me")
    //searchString = searchBar.text
    //}
    
    
    // everytime the text changes this delegate gets implimented
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchString = searchBar.text
    }
    
}
