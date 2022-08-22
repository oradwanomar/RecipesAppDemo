//
//  HeaderView.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 21/08/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let headIdentifier = "headerIdentifier"

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var searchTextView: UITextField!
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    var lastIndexActive: IndexPath = [1 ,0]
    
    var filters = ["All","LOW SUGER","KETO","VEGAN"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setUpSearchBar()
        setUpCollection()
    }
    
    func setUpSearchBar(){
        let searchBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 60))
        searchBtn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBtn.imageView?.tintColor = .label
        let spacer = UIView()
        spacer.setDimensions(height: 60, width: 35)
        spacer.addSubview(searchBtn)
        NSLayoutConstraint.activate([
            searchBtn.centerXAnchor.constraint(equalTo: spacer.centerXAnchor),
            searchBtn.centerYAnchor.constraint(equalTo: spacer.centerYAnchor),
        ])
        searchTextView.leftView = spacer
        searchTextView.leftViewMode = .always
        searchTextView.layer.cornerRadius = 10
    }
}


