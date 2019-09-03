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
        textLabel.text = "Hi"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor)
        ])
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
