//  
//  ProductsViewModelType.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import Foundation
import Networking

/// Products Input & Output
///
typealias ProductsViewModelType = ProductsViewModelInput & ProductsViewModelOutput

/// Products ViewModel Input
///
protocol ProductsViewModelInput {
    func getPaginationsRecipes(health: String)
}

/// Products ViewModel Output
///
protocol ProductsViewModelOutput {
    func getRecipes(health: String,from: Int, to: Int)
}
