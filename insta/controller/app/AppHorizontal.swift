//
//  AppHorizontal.swift
//  insta
//
//  Created by Haggag on 01/06/2021.
//

import UIKit


class AppHorizontal: horizantalspaninng,UICollectionViewDelegateFlowLayout {

    private let reid = "id22"
    var appgroup:AppGroup?
    var didselecthandler : ((FeedResults) -> ())?
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        collectionView.register(HorizontalAppCell.self, forCellWithReuseIdentifier: reid)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appgroup?.feed.results[indexPath.item]{
                didselecthandler?(app)
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appgroup?.feed.results.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reid, for: indexPath) as! HorizontalAppCell
        if let app = appgroup?.feed.results[indexPath.item]{
        cell.titlelb.text = app.name
        cell.aboutlb.text = app.artistName
        cell.img.sd_setImage(with: URL(string: app.artworkUrl100))
        }
        return cell
      
    }
    let topbottom:CGFloat = 10
    let leftright:CGFloat = 15
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-40 , height: (view.frame.height - 2*topbottom - 2*leftright) / 3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topbottom, left: leftright, bottom: topbottom, right: leftright)
    }}
