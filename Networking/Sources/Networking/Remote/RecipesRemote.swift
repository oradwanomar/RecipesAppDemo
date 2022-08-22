//
//  File.swift
//  
//
//  Created by Omar Ahmed on 22/08/2022.
//

import Foundation

/// Protocol for `ProductsRemote` mainly used for mocking.
///
public protocol RecipesRemoteProtocol {
    func loadAllRecipes(from: Int, to: Int,completion: @escaping (Result<RecipeModel, Error>) -> Void)
    
    func loadFilterdRecipes(health: String, from: Int, to: Int,completion: @escaping (Result<RecipeModel, Error>) -> Void)

}

/// Products: Remote Endpoints
///
public class RecipesRemote: Remote, RecipesRemoteProtocol {

    /// Loads all available products
    ///
    public func loadAllRecipes(from: Int = 0, to: Int = 5 ,completion: @escaping (Result<RecipeModel, Error>) -> Void){
        let path = "search"
        let characters = "abcdefghijklmnopqrstuvwxyz"
        let parameters = ["q": "\(String(describing: characters.randomElement()))",
                          "app_id": "\(APISettings.appID)",
                          "app_key": "\(APISettings.appKey)",
                          "from": from,
                          "to": to,
        ] as [String : Any]
        let request = EdamamAPIRequest(method: .get, path: path, parameters: parameters)

        enqueue(request, completion: completion)
    }
    
    public func loadFilterdRecipes(health: String, from: Int, to: Int,completion: @escaping (Result<RecipeModel, Error>) -> Void){
        let path = "search"
        let characters = "abcdefghijklmnopqrstuvwxyz"
        let parameters = ["q": "\(String(describing: characters.randomElement()))",
                          "app_id": "\(APISettings.appID)",
                          "health": "\(health)",
                          "app_key": "\(APISettings.appKey)",
                          "from": from,
                          "to": to,
        ] as [String : Any]
        let request = EdamamAPIRequest(method: .get, path: path, parameters: parameters)

        enqueue(request, completion: completion)
    }


    
}
