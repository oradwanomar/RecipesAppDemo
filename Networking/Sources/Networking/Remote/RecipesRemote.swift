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
    func loadAllRecipes(from: Int = 0, to: Int = 10 ,completion: @escaping (Result<RecipeModel, Error>) -> Void)
}

/// Products: Remote Endpoints
///
public class RecipesRemote: Remote, RecipesRemoteProtocol {

    /// Loads all available products
    ///
    func loadAllRecipes(from: Int = 0, to: Int = 10 ,completion: @escaping (Result<RecipeModel, Error>) -> Void){
        let path = "search"
        let parameters = ["app_id": APISettings.appID,
                          "app_key": APISettings.appKey,
                          "from": from,
                          "to": to,
        ]
        let request = EdamamAPIRequest(method: .get, path: path)

        enqueue(request, completion: completion)
    }

    
}
