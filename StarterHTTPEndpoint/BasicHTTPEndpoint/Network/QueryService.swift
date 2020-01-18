//
//  QueryService.swift
//  BasicHTTPEndpoint
//
//  Created by Martin Ffrench on 2020-01-16.
//  Copyright © 2020 Martin Ffrench. All rights reserved.
//

import UIKit
import Foundation

class QueryService{
    let defaultSession = URLSession(configuration: .default)
      
      //
      // MARK: - Variables And Properties
      //
      var dataTask:URLSessionDataTask?
      var errorMessage = ""
      var persons: [Person] = []
      
      //
      // MARK: - Type Alias
      //
      typealias JSONDictionary = [String: Any]
      typealias QueryResult = ([Person]?, String) -> Void
      
      //
      // MARK: - Internal Methods
      //
      // Here this function just gets the all the results from the local server
      // You can add a query by uncommenting the urlComponents.query line and adding a searchTerm
      func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
        dataTask?.cancel()
        // use your computer's ip address (i.e. http://<your ip>:5000/...)
        if var urlComponents = URLComponents(string: "http://192.168.0.16:5000/starSigns/all"){
          //urlComponents.query = "searchField=\(searchTerm)"
          guard let url = urlComponents.url else {
            return
          }
        
        //Todo 1: data task
        
        dataTask?.resume()
    }
        DispatchQueue.main.async {
          completion(self.persons, self.errorMessage)
        }
 }

      //
      // MARK: - Private Methods
      //
      // Modify Model based on response data
      private func updateSearchResults(_ data: Data) {
        var response: JSONDictionary?
        persons.removeAll()
        
        do {
          // Todo 2: Convert response to something we can use
          
        } catch let parseError as NSError {
          errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
          return
        }
        
        guard let array = response!["results"] as? [Any] else {
          errorMessage += "Dictionary does not contain results key\n"
          return
        }
        
        var index = 0
        
        for personDictionary in array {
            //Todo 3: Process data
          
        }
      }
}
