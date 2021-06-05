//
//  AppSearchCVV.swift
//  insta
//
//  Created by Haggag on 30/05/2021.
//

import UIKit
import SDWebImage

class AppSearchCVV: UICollectionViewController , UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    fileprivate let searchcontroller = UISearchController(searchResultsController: nil)
    fileprivate let cellid = "123"
    var appresult=[result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellid)


        setupsearchsearchbar()
    }
    fileprivate func setupsearchsearchbar (){
        navigationItem.searchController = self.searchcontroller
        navigationItem.hidesSearchBarWhenScrolling = false
        searchcontroller.obscuresBackgroundDuringPresentation = false
        searchcontroller.searchBar.delegate=self
    
    }
    
    var timer :Timer?
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            services.shared.fetching(searchtxt: searchText) { Results in
                self.appresult = Results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }}
        })
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! SearchResultCell
        let res = appresult[indexPath.item]
        cell.res = res
        return cell
           }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appresult.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 10, height: 380)
    }
    
    init() {

        super.init(collectionViewLayout: UICollectionViewFlowLayout())

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
