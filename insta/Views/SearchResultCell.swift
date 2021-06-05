//
//  SearchResultCell.swift
//  insta
//
//  Created by Haggag on 30/05/2021.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var res : result! {
        didSet{
            namelabel.text = res.trackName
            ratelabel.text = " \(res.averageUserRating)"
            catlabel.text = res.primaryGenreName
            let imgurl = URL(string:res.artworkUrl100)
            appimg.sd_setImage(with: imgurl)
            screenshot1.sd_setImage(with: URL(string: res.screenshotUrls[0]) )
            if res.screenshotUrls.count > 1{
                screenshot2.sd_setImage(with: URL(string: res.screenshotUrls[1]) )}
            if res.screenshotUrls.count > 2{
                screenshot3.sd_setImage(with: URL(string: res.screenshotUrls[2]) )}
            
        }}
    
    let appimg : UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 16
        iv.layer.borderWidth = 0.3
        iv.clipsToBounds = true
        iv.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return iv
    }()
    
    let namelabel :UILabel = {
       let label = UILabel()
        label.text = "App Name"
        return label
    }()
    let catlabel :UILabel = {
       let label = UILabel()
        label.text = "Categorey"
        return label
    }()

    let ratelabel :UILabel = {
       let label = UILabel()
        label.text = "Rate"
        return label
    }()

    
    let getbutton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GET", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        btn.backgroundColor = UIColor(white: 0.98, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 12
        btn.widthAnchor.constraint(equalToConstant: 80).isActive=true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive=true

        return btn
    }()
    
    lazy var screenshot1 = self.createscreenshots()
    lazy var screenshot2 = self.createscreenshots()
    lazy var screenshot3 = self.createscreenshots()
 
    func createscreenshots() -> UIImageView {
        let img = UIImageView()
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return img

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackvw2 = UIStackView(arrangedSubviews: [namelabel , catlabel , ratelabel])
        stackvw2.axis = .vertical
        let stackvw = UIStackView(arrangedSubviews: [appimg,stackvw2,getbutton])
        stackvw.spacing = 12
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.alignment = .center
        let screenshootstack = UIStackView(arrangedSubviews: [screenshot1 , screenshot2 , screenshot3])
        screenshootstack.spacing = 12
        screenshootstack.distribution = .fillEqually
        let overallstack = UIStackView(arrangedSubviews: [stackvw , screenshootstack ])
        overallstack.axis = .vertical
        overallstack.spacing = 10
        
        addSubview(overallstack)
        overallstack.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
