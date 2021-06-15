//
//  AppHeaderHorizontal.swift
//  insta
//
//  Created by Haggag on 02/06/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppHeaderHorizontal: horizantalspaninng , UICollectionViewDelegateFlowLayout {

    var result = [appheaderdata]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.register(AppHeaderCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

}

 
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return result.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.frame.width-40, height: view.frame.height - 10)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppHeaderCell
        let res = result[indexPath.item]
        cell.title.text = res.name
        cell.about.text = res.tagline
        cell.img.sd_setImage(with: URL(string: res.imageUrl))
        return cell
    }

}

