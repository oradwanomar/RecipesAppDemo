//  
//  ProductsViewController.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // MARK: Outlets

    // MARK: Properties
        
    private let viewModel: ProductsViewModelType

    // MARK: Init
        
    init(viewModel: ProductsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions
//
extension ProductsViewController {
    
}

// MARK: - Configurations
//
extension ProductsViewController {
    
}

// MARK: - Private Handlers
//
private extension ProductsViewController {
}
