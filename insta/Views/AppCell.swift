//  AppCell.swift
//  insta
//  Created by Haggag on 31/05/2021.
//

import UIKit

class AppCell: UICollectionViewCell {
    let namelb = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 25))
    let horizontalcontroller = AppHorizontal()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(namelb)
        namelb.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        addSubview(horizontalcontroller.view)
        horizontalcontroller.view.anchor(top: namelb.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


