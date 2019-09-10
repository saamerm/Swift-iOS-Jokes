//
//  CategoryCollectionViewCell.swift
//  SwiftJokes
//
//  Created by Saamer Mansoor on 2019-09-03.
//  Copyright © 2019 Saamer Mansoor. All rights reserved.
//
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "CategoryCollectionViewCell"
    
    weak var textLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        let horizontalConstraint2 = self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor)
        let verticalConstraint2 = self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint2, verticalConstraint2])
        let margins = self.contentView.layoutMarginsGuide
        textLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        textLabel.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20).isActive = true
        textLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        textLabel.numberOfLines = 0
        textLabel.textColor = UIColor.label
        
        textLabel.textAlignment = NSTextAlignment.center
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

        self.textLabel = textLabel
        self.reset()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func reset() {
        self.textLabel.textAlignment = .center
    }
}
