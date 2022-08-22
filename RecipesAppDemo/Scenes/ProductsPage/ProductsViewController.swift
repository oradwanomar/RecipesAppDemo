//  
//  ProductsViewController.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import UIKit
import Networking

class ProductsViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: Properties
        
    private let viewModel: ProductsViewModel
    var recipesData: [Recipe] = []
    var health: String = ""

    // MARK: Init
        
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection()
        
        viewModel.bindingRecipeViewModelToView = {
            for i in self.viewModel.recipe.hits {
                self.recipesData.append(i.recipe)
            }
            self.collectionView.reloadData()
        }
    }
    
    private func setUpCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.cellIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.headIdentifier)
    }
}

// MARK: - UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.cellIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.configureCell(recipe: recipesData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == recipesData.count - 1 {
            viewModel.getPaginationsRecipes(health: health)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.headIdentifier, for: indexPath) as! HeaderView
        header.delegate = self
        return header
    }
    
}

// MARK: - UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prodDetailsviewModel = ProductDetailsViewModel(recipe: recipesData[indexPath.row])
        let pVC = CustomNavigationViewController(rootViewController: ProductDetailsViewController(viewModel: prodDetailsviewModel))
        pVC.modalPresentationStyle = .custom
        self.present(pVC, animated: true)
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension ProductsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 2) / 3
        let width = view.frame.width
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 360)
    }
}
// MARK: - Actions
//
extension ProductsViewController {
    
}

// MARK: - Configurations
//
extension ProductsViewController {
    
    func createSpinner() -> UIActivityIndicatorView{
        let spinner = UIActivityIndicatorView()
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        return spinner
    }
    
}

// MARK: - Private Handlers
//
extension ProductsViewController: HeaderProtocol {
    func filterDidSelect(at index: IndexPath) {
        self.recipesData.removeAll()
        
        switch index.row {
        case 1:
            health = "low-sugar"
            viewModel.getRecipes(health: health)
        case 2:
            health = "keto-friendly"
        case 3:
            health = "vegan"
        default:
            health = ""
        }
        viewModel.getRecipes(health: health)
        self.collectionView.reloadData()
    }
    
}
