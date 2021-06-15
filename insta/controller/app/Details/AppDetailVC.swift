//
//  AppDetailVC.swift
//  insta
//
//  Created by Haggag on 15/06/2021.
//

import UIKit

class AppDetailVC: UICollectionViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow

    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
