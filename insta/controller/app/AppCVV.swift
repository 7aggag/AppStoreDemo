//
//  AppCVV.swift
//  insta
//  Created by Haggag on 31/05/2021.

import UIKit

private let reId = "id12"
private let reid2 = "id13"

class AppCVV: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var appgroup = [AppGroup]()
    var group1 :AppGroup?
    var group2 :AppGroup?
    var group3 :AppGroup?
    var appheader = [appheaderdata]()
    let actv :UIActivityIndicatorView = {
        let iv = UIActivityIndicatorView(style: .large)
        iv.color = .darkGray
        iv.startAnimating()
        iv.hidesWhenStopped = true
        return iv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(actv)
        actv.fillSuperview()
        collectionView.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: reId)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reid2)
        Fetch()
    }

   fileprivate func Fetch(){
    let dispatchGroup = DispatchGroup()
    dispatchGroup.enter()
    services.shared.fetchingheader { appheader, Error in
        dispatchGroup.leave()
        self.appheader = appheader ?? []
    }
    dispatchGroup.enter()
    services.shared.fetchingTopApp { appgroup, err in
        dispatchGroup.leave()
        self.group1 = appgroup}
    dispatchGroup.enter()
    services.shared.fetchingTopGross { appgroup, err in
        dispatchGroup.leave()
        self.group2 = appgroup
        }
    dispatchGroup.enter()
    services.shared.fetchingTopGames { appgroup, err in
        dispatchGroup.leave()
        self.group3 = appgroup
        }
    dispatchGroup.notify(queue: .main) {[self] in
        if let group = self.group1 {
            appgroup.append(group)
        }
        if let group = group2 {
            appgroup.append(group)
        }
        if let group = group3 {
            appgroup.append(group)
        }
        self.actv.stopAnimating()
        self.collectionView.reloadData()
        
    }}
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let redcontroller = UIViewController()
        redcontroller.view.backgroundColor = .red
        navigationController?.pushViewController(redcontroller, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reId, for: indexPath) as! AppCell
        let appgroup = appgroup[indexPath.item]
        cell.namelb.text = appgroup.feed.title
        cell.horizontalcontroller.appgroup = appgroup
        cell.horizontalcontroller.collectionView.reloadData()
        cell.horizontalcontroller.didselecthandler = { [weak self ] FeedResults in
            let Controllervc = AppDetailVC()
            Controllervc.navigationItem.title = "\(FeedResults.name)"
            Controllervc.navigationItem.largeTitleDisplayMode = .never
            self?.navigationController?.pushViewController(Controllervc, animated: true)
        }
        
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appgroup.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.frame.width - 10, height: 300)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reid2, for: indexPath) as! AppsHeader
        header.appheaderVVC.result = appheader
        header.appheaderVVC.collectionView.reloadData()
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return . init(width: view.frame.width, height: 300)
    }
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
