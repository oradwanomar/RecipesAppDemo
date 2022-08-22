//
//  ProductCollectionViewCell.swift
//  RecipesAppDemo
//
//  Created by Omar Ahmed on 20/08/2022.
//

import UIKit
import Networking
import Kingfisher
import SkeletonView

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RestaurantListCollectionViewCell"
    var benefitHeightConstrains: NSLayoutConstraint?
    var locationHeightConstrains: NSLayoutConstraint?
    
    //MARK: Prop
    lazy var restaurantImageCard: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    lazy var restaurantImgCover: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        return img
    }()
    
    lazy var offerView: UIView = {
        let offer = UIView()
        offer.translatesAutoresizingMaskIntoConstraints = false
        offer.backgroundColor = .systemBackground
        offer.layer.cornerRadius = 5
        offer.layer.borderWidth = 0.6
        offer.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        offer.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        offer.layer.shadowOffset = CGSize(width: 0, height: 4)
        offer.layer.shadowOpacity = 1
        offer.layer.shadowRadius = 5
    
        return offer
    }()
    
    let offerLabel: UILabel = {
        let o = UILabel()
        o.translatesAutoresizingMaskIntoConstraints = false
        o.textAlignment = .center
        o.numberOfLines = 2
        return o
    }()
    
    lazy var restaurantName: UILabel = {
        let res = UILabel()
        res.translatesAutoresizingMaskIntoConstraints = false
        res.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        res.textColor = .label
        res.text = "Zimoz ast. lv"
        return res
    }()
    
    let restaurantInfoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let restaurantTagLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        l.textColor = .darkGray.withAlphaComponent(0.8)
        return l
    }()
    
    let restaurantLocationLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .darkGray.withAlphaComponent(0.8)
        l.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        return l
    }()
    
    let benefitView: UIView = {
        let bn = UIView()
        bn.translatesAutoresizingMaskIntoConstraints = false
        bn.layer.cornerRadius = 8
        bn.layer.cornerCurve = .continuous
        bn.layer.masksToBounds = true
        return bn
    }()
    
    let gradientView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let benefitIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "ic_benefit")
        return img
    }()
    
    let benefitLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .orange
        l.font = UIFont.systemFont(ofSize: 11,weight: .bold)
        return l
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpConstrains()
    }
    
    func configureCell(recipe: Recipe){
        restaurantImgCover.kf.indicatorType = .activity
        restaurantImgCover.kf.setImage(with: URL(string: recipe.image))
        restaurantName.text = recipe.label
        restaurantInfoLabel.text = recipe.source
    }
    
    func configure(){
        addSubview(restaurantImageCard)
        restaurantImageCard.addSubview(restaurantImgCover)
        
        addSubview(offerView)
        offerView.addSubview(offerLabel)
        
        addSubview(restaurantName)
        addSubview(restaurantInfoLabel)
        addSubview(restaurantTagLabel)
        addSubview(restaurantLocationLabel)
        
        addSubview(benefitView)
        benefitView.addSubview(gradientView)
        benefitView.addSubview(benefitIcon)
        benefitView.addSubview(benefitLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) { [self] in
            gradientView.setGradient(withColors: [UIColor.white.withAlphaComponent(0).cgColor, UIColor.orange.withAlphaComponent(0.3).cgColor], startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 1.0))
        }
        
        offerLabel.attributedText = setOfferAttributedLabel(withTitle: "20% Off", withSubtitle: "upto ₹140")
        benefitLabel.text = "extra 20% off + free delivery".uppercased()
    }
    
    func setUpConstrains(){
        restaurantImgCover.setUp(to: restaurantImageCard)
        offerLabel.setUp(to: offerView)
        gradientView.setUp(to: benefitView)
        
        NSLayoutConstraint.activate([
            restaurantImageCard.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            restaurantImageCard.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            restaurantImageCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            restaurantImageCard.widthAnchor.constraint(equalToConstant: 100),
            
            offerView.leadingAnchor.constraint(equalTo: restaurantImageCard.leadingAnchor, constant: 5),
            offerView.trailingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: -5),
            offerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            offerView.heightAnchor.constraint(equalToConstant: 32),
            
            restaurantName.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantName.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantName.bottomAnchor.constraint(equalTo: restaurantInfoLabel.topAnchor, constant: -3),
            
            restaurantInfoLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            restaurantInfoLabel.bottomAnchor.constraint(equalTo: restaurantTagLabel.topAnchor, constant: -5),
            
            restaurantTagLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantTagLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantTagLabel.bottomAnchor.constraint(equalTo: restaurantLocationLabel.topAnchor, constant: -8),
            
            restaurantLocationLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            benefitView.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            benefitView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            benefitView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            benefitLabel.leadingAnchor.constraint(equalTo: benefitView.leadingAnchor, constant: 5),
            benefitLabel.trailingAnchor.constraint(equalTo: benefitView.trailingAnchor, constant: -10),
            benefitLabel.centerYAnchor.constraint(equalTo: benefitView.centerYAnchor),
            
            benefitIcon.trailingAnchor.constraint(equalTo: benefitView.trailingAnchor, constant: -5),
            benefitIcon.centerYAnchor.constraint(equalTo: benefitView.centerYAnchor),
            benefitIcon.widthAnchor.constraint(equalToConstant: 40),
            benefitIcon.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        benefitHeightConstrains = benefitView.heightAnchor.constraint(equalToConstant: 30)
        benefitHeightConstrains?.isActive = true
        
        locationHeightConstrains = restaurantLocationLabel.bottomAnchor.constraint(equalTo: benefitView.topAnchor, constant: -8)
        locationHeightConstrains?.isActive = true
        
    }
    
    
    func setOfferAttributedLabel(withTitle title: String, withSubtitle subtitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title.uppercased(), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13,weight: .bold) , NSAttributedString.Key.foregroundColor: UIColor.orange]))
        attributedText.append(NSAttributedString(string: "\n• \(subtitle) •".uppercased(), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 7,weight: .regular) , NSAttributedString.Key.foregroundColor: UIColor.orange]))
        return attributedText
    }
    
    func setRestaurantInfoLabel(withRating rating: Float, withTime time: String , withDesc desc: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string:"")
        
        let fontSize = 13.0
        let fontColor = UIColor.darkGray
        let font = UIFont.systemFont(ofSize: fontSize,weight: .regular)
        
        // Star Icon
        let starImg = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        let starImage = NSTextAttachment()
        starImage.image = starImg?.withTintColor(fontColor)
        starImage.bounds = CGRect(x: 0, y: (font.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
//        starImage.setImageHeight(height: fontSize)
        let imgString = NSAttributedString(attachment: starImage)
        attributedText.append(imgString)
        
        attributedText.append(NSAttributedString(string: "  \(rating)  •  \(time)  •  \(desc)" , attributes:[NSAttributedString.Key.font: font , NSAttributedString.Key.foregroundColor: fontColor]))
        
        return attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    
    func setUp(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func setGradient(withColors colors: [CGColor] , startPoint: CGPoint , endPoint: CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}

