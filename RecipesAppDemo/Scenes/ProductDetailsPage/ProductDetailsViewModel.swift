//  
//  ProductDetailsViewModel.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import Foundation
import Networking

// MARK: ProductDetailsViewModel
//
class ProductDetailsViewModel {
     
    var recipeDetail: Recipe?
    
    init(recipe: Recipe? = nil){
        self.recipeDetail = recipe
    }
}

// MARK: ProductDetailsViewModel

extension ProductDetailsViewModel: ProductDetailsViewModelInput {

}

// MARK: ProductDetailsViewModelOutput
//
extension ProductDetailsViewModel: ProductDetailsViewModelOutput {

}

// MARK: Private Handlers
//
private extension ProductDetailsViewModel {

}
