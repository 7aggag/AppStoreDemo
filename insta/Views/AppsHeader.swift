//
//  AppsHeader.swift
//  insta
//
//  Created by Haggag on 02/06/2021.
//

import UIKit
class AppsHeader: UICollectionReusableView {
    let appheaderVVC = AppHeaderHorizontal()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appheaderVVC.view)
        appheaderVVC.view.fillSuperview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
