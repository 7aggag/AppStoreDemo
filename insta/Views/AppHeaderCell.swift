//
//  AppHeaderCell.swift
//  insta
//
//  Created by Haggag on 02/06/2021.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    let title :  UILabel = {
        let tlb = UILabel()
        tlb.font = .boldSystemFont(ofSize: 12)
        tlb.text = "Facebook"
        return tlb
    }()
    let img :UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        return img
    }()
    let about : UILabel = {
        let tlb = UILabel()
        tlb.numberOfLines = 2
        tlb.text = "Kepping up with Freinds download apps  , haggag send his regards "
        tlb.font = .boldSystemFont(ofSize: 20)
        return tlb
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stac1 = UIStackView(arrangedSubviews: [title,about,img])
        stac1.axis = .vertical
        stac1.spacing = 10
        stac1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stac1)
        stac1.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 15))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }}
