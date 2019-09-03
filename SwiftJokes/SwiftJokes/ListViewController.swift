//
//  ViewController.swift
//  SwiftJokes
//
//  Created by Saamer Mansoor on 2019-09-03.
//  Copyright © 2019 Saamer Mansoor. All rights reserved.
//
import UIKit

class ListViewController: UIViewController, UICollectionViewDataSource {
    let leftAndRightPaddings: CGFloat = 80.0
    let numberOfItemsPerRow: CGFloat = 7.0
    let screenSize: CGRect = UIScreen.main.bounds
    private let cellReuseIdentifier = "CategoryCollectionViewCell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    
    // MARK: Base function override
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.cyan
        self.view.addSubview(collectionView)
    }
    
    // MARK: 1st Function required in order to implement the UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.items.count
    }
    
    // MARK: 2nd Function required in order to implement the UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = UIColor.green
        return cell
    }
}
