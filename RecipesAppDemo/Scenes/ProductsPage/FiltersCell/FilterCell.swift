//
//  FilterCell.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 21/08/2022.
//

import UIKit

class FilterCell: UICollectionViewCell {
    static let identifier = "FilterCell"

    @IBOutlet weak var filterName: UILabel!
    
    @IBOutlet weak var filterView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filterView.clipsToBounds = true
        filterView.layer.cornerRadius = 10
        // Initialization code
    }
    
}
