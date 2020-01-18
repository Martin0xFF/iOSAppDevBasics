//
//  Person.swift
//  BasicHTTPEndpoint
//
//  Created by Martin Ffrench on 2020-01-16.
//  Copyright © 2020 Martin Ffrench. All rights reserved.
//
// In this class, we create a nice object to store our Person data
import Foundation.NSURL

class Person {
  //
  // MARK: - Constants
  //
  let name: String
  let id: Int
  let alignment: String
  let starSign: String
  let healthData:Float
  //
  //MARK: - Variables
  //
  var downloaded = false
    
  //
  // MARK: - Initialization
  //
  // When the person class is called, it will run through the below function so we know what values the person will have.
    init(name: String, id: Int, alignment: String, starSign: String, healthData: Float) {
    self.name = name
    self.id = id
    self.alignment = alignment
    self.starSign = starSign
    self.healthData = healthData
  }
}
