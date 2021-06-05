//
//  HorizontalAppCell.swift
//  insta
//
//  Created by Haggag on 01/06/2021.
//

import UIKit

class HorizontalAppCell: UICollectionViewCell {
    
    let titlelb :UILabel = {
        let lb = UILabel()
        lb.text = "haggag"
        return lb
    }()
    let aboutlb :UILabel = {
        let lb = UILabel()
        lb.text = "lll"
        return lb
    }()
    let img :UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        img.layer.cornerRadius = 16
        img.layer.borderWidth = 0.3
        img.clipsToBounds = true
        img.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return img
    }()
    let btn :UIButton={
        let btn = UIButton()
        btn.setTitle("Get", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        btn.backgroundColor = UIColor(white: 0.98, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 12
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        btn.constrainHeight(constant: 30)
        btn.constrainWidth(constant: 80)
        img.constrainHeight(constant: 60)
        img.constrainWidth(constant: 60)
        let stack1 = UIStackView(arrangedSubviews: [titlelb , aboutlb])
        stack1.axis = .vertical
        stack1.spacing = 3
        let stack2 = UIStackView(arrangedSubviews: [img , stack1 , btn])
        addSubview(stack2)
        stack2.translatesAutoresizingMaskIntoConstraints=false
        stack2.alignment = .center
        stack2.spacing = 15
        stack2.fillSuperview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
