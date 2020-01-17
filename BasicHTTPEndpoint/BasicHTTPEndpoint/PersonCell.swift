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
  func cancelTapped(_ cell: PersonCell)
  func downloadTapped(_ cell: PersonCell)
  func pauseTapped(_ cell: PersonCell)
  func resumeTapped(_ cell: PersonCell)
}

class PersonCell: UITableViewCell {

    //
    // MARK: - Class Constants
    //
    static let identifier = "PersonCell"
    
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starSignLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    var delegate: PersonCellDelegate?
    
    func configure(person: Person, downloaded: Bool) {
        nameLabel.text = person.name
        alignmentLabel.text = person.alignment
        starSignLabel.text = person.starSign
    }
}
    
    
