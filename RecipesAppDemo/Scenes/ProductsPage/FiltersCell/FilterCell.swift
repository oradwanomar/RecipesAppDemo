//
//  FilterCell.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 21/08/2022.
//

import UIKit

class FilterCell: UICollectionViewCell {
    static let identifier = "FilterCell"
    
    lazy var filterName: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(filterName)
        setUpConstrains()
    }
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            filterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            filterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            filterName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
