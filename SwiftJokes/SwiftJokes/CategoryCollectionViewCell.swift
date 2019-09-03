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
    }
}
