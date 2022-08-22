//  
//  ProductDetailsViewController.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var bluredView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    // MARK: Properties
        
    private let viewModel: ProductDetailsViewModel

    // MARK: Init
        
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureBlurView()
        productImage.kf.setImage(with: URL(string: viewModel.recipeDetail?.image ?? ""))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
}

// MARK: - Actions
//
extension ProductDetailsViewController {
    
}

// MARK: - Configurations
//
extension ProductDetailsViewController {
    func configureNavBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.circle"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .label
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
    }
    
    
    func configureBlurView(){
        bluredView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bluredView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bluredView.addSubview(blurEffectView)
        bluredView.layer.cornerRadius = 40
    }
    
}

// MARK: - Private Handlers
//
private extension ProductDetailsViewController {
}
