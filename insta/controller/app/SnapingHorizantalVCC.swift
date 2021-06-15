//
//  SnapingHorizantalVCC.swift
//  insta
//
//  Created by Haggag on 05/06/2021.
//
import UIKit
class horizantalspaninng : UICollectionViewController {
    
        init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

