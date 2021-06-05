//
//  BaseTabarController.swift
//  insta
//
//  Created by Haggag on 30/05/2021.
//

import Foundation
import UIKit

class BaseTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let todayviewcontroller = UIViewController()


        
        viewControllers = [ createnwvcontroller(viewcontroller: AppCVV(), title: "Apps", imagename: "apps") , createnwvcontroller(viewcontroller: AppSearchCVV(), title: "Search", imagename: "search") , createnwvcontroller(viewcontroller: todayviewcontroller, title: "Today", imagename: "today"),
                           
                           ]
        
        
    }
    fileprivate func createnwvcontroller(viewcontroller:UIViewController, title :String , imagename : String)-> UIViewController{
        let navcontroller = UINavigationController(rootViewController: viewcontroller)
        navcontroller.navigationBar.prefersLargeTitles = true
        navcontroller.tabBarItem.title = title
        viewcontroller.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        viewcontroller.navigationItem.title = title
        navcontroller.tabBarItem.image = UIImage(named: imagename)
        return navcontroller
    }
    
}
