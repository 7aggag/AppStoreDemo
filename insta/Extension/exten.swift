//
//  exten.swift
//  insta
//
//  Created by Haggag on 31/05/2021.
//

import  UIKit

extension UILabel {
    
    convenience init(text:String , font :UIFont){
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
    
}

