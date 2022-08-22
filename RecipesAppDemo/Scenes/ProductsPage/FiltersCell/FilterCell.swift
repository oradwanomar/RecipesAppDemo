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
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dotView: UIView = {
        let d = UIView()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.layer.cornerRadius = 5
        d.backgroundColor = .orange
        return d
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(filterName)
        addSubview(dotView)
        setUpConstrains()
    }
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            filterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            filterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            filterName.heightAnchor.constraint(equalToConstant: 30),
            
            dotView.heightAnchor.constraint(equalToConstant: 10),
            dotView.widthAnchor.constraint(equalToConstant: 10),
            dotView.centerXAnchor.constraint(equalTo: filterName.centerXAnchor),
            dotView.topAnchor.constraint(equalTo: filterName.bottomAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
