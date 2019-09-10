//
//  ViewController.swift
//  SwiftJokes
//
//  Created by Saamer Mansoor on 2019-09-03.
//  Copyright © 2019 Saamer Mansoor. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class ListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    var jokeList: [String] = []
    let leftAndRightPaddings: CGFloat = 80.0
    var numberOfItemsPerRow: CGFloat = 1.0
    var collectionView: UICollectionView!

    //    let numberOfItemsPerRow: CGFloat = 1
    var screenSize: CGRect = UIScreen.main.bounds
    private let cellReuseIdentifier = "CategoryCollectionViewCell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    
    // MARK: Base function overrides
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.systemTeal
        self.view.addSubview(collectionView)
        LoadApi(collectionView: collectionView)
    }
    
    func LoadApi(collectionView: UICollectionView){
        Alamofire.request("https://api.icndb.com/jokes").responseJSON { response in
                if let result = response.result.value {
                    // { "type": "success", "value": [ { "id": 1, "joke": "MacGyver can build an airplane out of gum and paper clips. Chuck Norris can kill him and take it.", "categories": ["explicit"] }]}
                    let json = JSON(result)
                    print(json["type"]) // Prints "success"
                    for item in json["value"].arrayValue {
                        self.jokeList.append(item["joke"].stringValue)
                    }
                    collectionView.reloadData()
            }
        }
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
        cell.backgroundColor = UIColor.systemRed
        if (jokeList.count > 0)
        {
            cell.textLabel.text = jokeList[indexPath.row]
        }
        return cell
    }
    
    // MARK: Change padding arround each cell and the top
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 8, bottom: 5, right: 8)
    }
    
    // MARK: Change size of individual cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (screenSize.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
