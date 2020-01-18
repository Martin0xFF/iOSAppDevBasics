//
//  PersonCell.swift
//  BasicHTTPEndpoint
//
//  Created by Martin Ffrench on 2020-01-16.
//  Copyright © 2020 Martin Ffrench. All rights reserved.
//

import UIKit


//
// MARK: - Delegate Protocols
//
protocol PersonCellDelegate {
  func tapped(_ cell: PersonCell)
}

class PersonCell: UITableViewCell {

    //
    // MARK: - Class Constants
    //
    static let identifier = "PersonCell"
    
    //
    // MARK: - IBOutlets
    //
    
    // Interface Builder outlets, allows us to reference the different elements we have in our story board
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starSignLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var data: UILabel!
        
    // create a PersonCellDelegate object so we can use it to send data between Views
    var delegate: PersonCellDelegate?
    
    //MARK: - IBAction
    // This is a stub, you will need to add a button ui element to the personcell and connect it to this IB function
       @IBAction func cellButtonTapped(_ sender:AnyObject){
        delegate?.tapped(self)
       }
    
    // Add the data to our Cell view
    func configure(person: Person, downloaded: Bool) {
        progressBar.setProgress (person.healthData/100, animated: true)
        
        nameLabel.text = person.name
        alignmentLabel.text = person.alignment
        starSignLabel.text = person.starSign
        let health = String(format: "%.2f", person.healthData)
        data.text = health
    }
}
    
    
