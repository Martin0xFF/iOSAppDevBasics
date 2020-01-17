//
//  ViewController.swift
//  BasicHTTPEndpoint
//
//  Created by Martin Ffrench on 2020-01-16.
//  Copyright © 2020 Martin Ffrench. All rights reserved.
//


// Todo: add progress bar indicator
// add metric indicator
// add POST support for local image file
// on flask side, add code to receive image
// Clean up code base

import UIKit

class ViewController: UIViewController {
    
    let queryService = QueryService()
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults: [Person] = []
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Here we automatically update the table every 2 seconds
        
        var _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: Selector(("updateTable")), userInfo: nil, repeats: true)
        
        
    }
    
    func reload(_ row: Int) {
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
    
}

extension ViewController: UITableViewDelegate {
  // You can dynamically modify some features of the tables by extending our
  // View controller, change the return value and see what happens
 
  
  func tableView(_ tableView:
    UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 93
  }
  
}



extension ViewController: UITableViewDataSource {
 
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell: PersonCell = tableView.dequeueReusableCell(withIdentifier: PersonCell.identifier,for: indexPath) as! PersonCell
       
       cell.delegate = self
       
       let person = searchResults[indexPath.row]
       cell.configure(person: person, downloaded: person.downloaded)
       
       return cell
     }
    
}



extension ViewController: PersonCellDelegate {
  func cancelTapped(_ cell: PersonCell) {
    if let indexPath = tableView.indexPath(for: cell) {
      //let person = searchResults[indexPath.row]
      reload(indexPath.row)
    }
  }
  
  func downloadTapped(_ cell: PersonCell) {
    if let indexPath = tableView.indexPath(for: cell) {
      //let person = searchResults[indexPath.row]
      reload(indexPath.row)
    }
  }
  
  func pauseTapped(_ cell: PersonCell) {
    if let indexPath = tableView.indexPath(for: cell) {
      //let person = searchResults[indexPath.row]
      reload(indexPath.row)
    }
  }
  
  func resumeTapped(_ cell: PersonCell) {
    if let indexPath = tableView.indexPath(for: cell) {
      //let person = searchResults[indexPath.row]
      reload(indexPath.row)
    }
  }
}
