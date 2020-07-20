//
//  ApiManager.swift
//  ARACRUD
//
//  Created by Toni De Gea on 17/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let instance = ApiManager()
    
    var characters = [User]()
    
    
    //MARK: - Get
    
    func getAllCharacters(completion: @escaping CompletionHandler) {
        Alamofire.request(BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else { return  }
                
                do {
                    self.characters = try JSONDecoder().decode([User].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
                
                completion(true)
                
            } else {
                completion(false)
            }
        }
    }
    
    func sortAllCharactersDescByName(completion: @escaping CompletionHandler) {

        let param: [String: Any] = [
            "sortBy": "name",
            "order": "desc"
        ]

        Alamofire.request("\(BASE_URL)", method: .get, parameters: param).responseJSON { (response) in
            
            if response.result.error == nil {

                guard let data = response.data else { return }

                do {
                    self.characters = try JSONDecoder().decode([User].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }

                completion(true)

            } else {
                completion(false)
            }
        }
    }
    
    func sortAllCharactersAscByName(completion: @escaping CompletionHandler) {

        let param: [String: Any] = [
            "sortBy": "name",
            "order": "asc"
        ]

        Alamofire.request("\(BASE_URL)", method: .get, parameters: param).responseJSON { (response) in
            
            if response.result.error == nil {

                guard let data = response.data else { return }

                do {
                    self.characters = try JSONDecoder().decode([User].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }

                completion(true)

            } else {
                completion(false)
            }
        }
    }
    
    func getCharacterByName(name: String, completion: @escaping CompletionHandler) {

        let param: [String: Any] = [
            "name": name
        ]

        Alamofire.request("\(BASE_URL)", method: .get, parameters: param).responseJSON { (response) in
            
            if response.result.error == nil {

                guard let data = response.data else { return }

                do {
                    self.characters = try JSONDecoder().decode([User].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }

                completion(true)

            } else {
                completion(false)
            }
        }
    }
    
    
    //MARK: - Post
    
    func registerCharacter(name: String, birthdate: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "name": name,
            "birthdate": birthdate
        ]
        
        Alamofire.request(BASE_URL, method: .post, parameters: body, encoding: JSONEncoding.default).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    //MARK: - Put
    
    func updateCharacter(name: String, birthdate: String, id: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "id": id,
            "name": name,
            "birthdate": birthdate
        ]
        
        Alamofire.request("\(BASE_URL)/\(id)", method: .put, parameters: body, encoding: JSONEncoding.default).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
}
