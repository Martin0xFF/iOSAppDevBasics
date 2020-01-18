//
//  ViewController.swift
//  BasicHTTPEndpoint
//
//  Created by Martin Ffrench on 2020-01-16.
//  Copyright © 2020 Martin Ffrench. All rights reserved.
//
//N.B - nota bene - take note
// Todo - fill in this section
import UIKit

class ViewController: UIViewController {
    
    let queryService = QueryService()
    var searchResults: [Person] = []
    @IBOutlet weak var tableView: UITableView!
    //
    // MARK: - Table Update Function
    //
    
    @objc func updateTable(){
                // the self keyword refers to the class which houses the function
                self.queryService.getSearchResults(searchTerm: "") { [weak self] results, errorMessage in
                  if let results = results {
                    self?.searchResults = results
                    self?.tableView.reloadData()
                    self?.tableView.setContentOffset(CGPoint.zero, animated: false)
                    // Swift has a nice debug function called dump
                    // you can use it to see all the members of an instance of an object
                    // dump(self?.tableView)
                    
                }
                  
                  if !errorMessage.isEmpty {
                    print("Search error: " + errorMessage)
                  }
                }
                
            }
    
    // Main Function which gets called when the View is visible, you can use it as an init function
    override func viewDidLoad() {
        // Super refers to the Super class UIViewController
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        self.updateTable()
        
        // Here we automatically update the table every 0.66 seconds
       //Todo: 1 replace the button with a timer
        
    }
    
    @IBAction func tapReload(_ sender: Any) {
    }
    func reload(_ row: Int) {
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
    
}

//N.B 1: View controller

extension ViewController: UITableViewDelegate {
  // You can dynamically modify some features of the tables by extending our
  // View controller, change the return value and see what happens
 
  func tableView(_ tableView:
    UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 93
  }
// You can execute some code when a cell is tapped
 func tableView(_ tableView:UITableView, didSelectRowAt indexpath: IndexPath){
        reload(indexpath.row)
    }
}

extension ViewController: UITableViewDataSource {
  // To use dynamic properties of tables you need to specify the number of rows
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }
   // And the content of each cell
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: PersonCell = tableView.dequeueReusableCell(withIdentifier: PersonCell.identifier,for:
        indexPath) as! PersonCell
    
    cell.delegate = self
    let person = searchResults[indexPath.row]
    cell.configure(person: person, downloaded: person.downloaded)
    return cell
  }
    
}

//MARK: - Cell Interaction Functions
// you can modify this to execute some code when the cell is tapped
extension ViewController: PersonCellDelegate {
  func tapped(_ cell: PersonCell) {
    if let indexPath = tableView.indexPath(for: cell) {
      //let person = searchResults[indexPath.row]
      reload(indexPath.row)
    }
  }
}
