//
//  Person.swift
//  BasicHTTPEndpoint
//
//  Created by Martin Ffrench on 2020-01-16.
//  Copyright © 2020 Martin Ffrench. All rights reserved.
//
import Foundation.NSURL

class Person {
  //
  // MARK: - Constants
  //
  let name: String
  let id: Int
  let alignment: String
  let starSign: String
  
  //
  //MARK: - Variables
  //
  var downloaded = false
    
  //
  // MARK: - Initialization
  //
  init(name: String, id: Int, alignment: String, starSign: String) {
    self.name = name
    self.id = id
    self.alignment = alignment
    self.starSign = starSign
  }
}
