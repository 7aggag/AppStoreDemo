//
//  Services.swift
//  insta
//
//  Created by Haggag on 31/05/2021.
//

import Foundation
import UIKit

class services {
    
    static let shared = services()
    
    func fetching (searchtxt : String , completion : @escaping([result])->()) {
        guard let url = URL(string:"https://itunes.apple.com/search?term=\(searchtxt)&entity=software") else {return}
        URLSession.shared.dataTask(with: url) { data, ress, err in
            if let err = err{
                print("ERROR",err)
                return
            }
            //scuss
        guard let data = data else {return}
            do{
                let dat=try JSONDecoder().decode(Results.self, from: data)
                guard let x = dat.results else {return}
                completion(x)
            }
            catch let jsErr{
                print("Json error", jsErr)
            }
        }.resume()
    }
    func  fetchingheader(completion: @escaping([appheaderdata]? , Error?)->() ){
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/social") else {return}
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err {
                completion(nil,err)
            }
            do {
                let dat = try JSONDecoder().decode([appheaderdata].self, from: data!)
                completion(dat, nil)
            }
            catch let jsErr{
                print("Json error", jsErr)
            }
        }.resume()
    }
    func fetchingTopApp (completion :@escaping(AppGroup? , Error? )->()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        fetchingappgroup(urlstring: url, completion: completion)
    }

    func fetchingTopGross (completion :@escaping(AppGroup? , Error? )->()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/10/explicit.json"
        fetchingappgroup(urlstring: url, completion: completion)
        
    }
    func fetchingTopGames (completion :@escaping(AppGroup? , Error? )->()) {
       let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        fetchingappgroup(urlstring: url, completion: completion)
    }
    func fetchingappgroup (urlstring : String , completion : @escaping(AppGroup? , Error? )->()){
        guard let url = URL(string:urlstring) else {return}
        FetchingJson(URlString: url, completion: completion)
    }
    func FetchingJson<T:Decodable>(URlString : URL , completion : @escaping (T?, Error?)->()){
        URLSession.shared.dataTask(with: URlString) { data, ress, err in
            if let err = err {
                completion(nil, err)
                return
                
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
            }
            catch let jserr {
                print("Json error", jserr)
            }
        }.resume()}
    
    
    
}
