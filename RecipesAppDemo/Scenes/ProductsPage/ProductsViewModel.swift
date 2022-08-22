//  
//  ProductsViewModel.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import Foundation
import Networking

// MARK: ProductsViewModel
//
class ProductsViewModel {
    
  private let remote = RecipesRemote(network: AlamofireNetwork())
    
  var bindingRecipeViewModelToView : (()->()) = {}
    
  var from: Int = 0
    
  var to: Int = 5
    
  var recipe: RecipeModel! {
      didSet {
          self.bindingRecipeViewModelToView()
      }
  }
        
    init(){
        self.getRecipes()
    }
    
}

// MARK: ProductsViewModel

extension ProductsViewModel: ProductsViewModelInput {
    
    
    func getPaginationsRecipes(health: String = "") {
        if let recipe = recipe {
            if recipe.more {
                from = to
                to += 5
                self.getRecipes(health: health, from: from, to: to)
            }
        }
    }
    

}

// MARK: ProductsViewModelOutput
//
extension ProductsViewModel: ProductsViewModelOutput {
    
    func getRecipes(health: String = "",from: Int = 0, to: Int = 5) {
        if health == "" {
            remote.loadAllRecipes(from: from, to: to) { result in
                switch result {
                case .success(let recipe):
                    self.recipe = recipe
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }else {
            remote.loadFilterdRecipes(health: health, from: from, to: to) { result in
                switch result {
                case .success(let recipe):
                    self.recipe = recipe
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        
    }
    
      
}

// MARK: Private Handlers
//
private extension ProductsViewModel {

}
