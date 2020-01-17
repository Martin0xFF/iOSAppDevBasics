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
      func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
        dataTask?.cancel()
        // use your computer's ip address (i.e. http://<your ip>:5000/...)
        if var urlComponents = URLComponents(string: "http://192.168.0.16:5000/starSigns/all"){
          //urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
          guard let url = urlComponents.url else {
            return
          }
        
        dataTask =
          defaultSession.dataTask(with: url){[weak self] data, response, error in
            defer {
              self?.dataTask = nil
            }
        
        
        if let error = error {
          self?.errorMessage += "DataTask error: " +
          error.localizedDescription + "\n"
        }else if
          let data = data,
          let response = response as? HTTPURLResponse,
          response.statusCode == 200 {
          self?.updateSearchResults(data)
          DispatchQueue.main.async {
            completion(self?.persons,
                       self?.errorMessage ?? "")
          }
        }
      }
        dataTask?.resume()
    }
        DispatchQueue.main.async {
          completion(self.persons, self.errorMessage)
        }
      }

      //
      // MARK: - Private Methods
      //
      private func updateSearchResults(_ data: Data) {
        var response: JSONDictionary?
        persons.removeAll()
        
        do {
          response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
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
          if let personDictionary = personDictionary as? JSONDictionary,
            let starSign = personDictionary["star_sign"] as? String,
            let name = personDictionary["name"] as? String,
            let alignment = personDictionary["alignment"] as? String {
            persons.append(Person(name: name, id: index, alignment: alignment, starSign:starSign ))
              index += 1
          } else {
            errorMessage += "Problem parsing nameDictionary\n"
          }
        }
      }
}
