//
//  TabBarViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    var data: [DataBase] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navBarSetup()
//        tabBarSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navBarSetup()
        tabBarSetup()
    }
   
    
    private func navBarSetup() {
        
        navigationController?.navigationBar.tintColor = UIColor(named: ColorSets.mainSysColor.rawValue)
    }
    private func tabBarSetup() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: K.mainSystemFont, size: 20)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: K.mainSystemFont, size: 20)!], for: .selected)
        UITabBar.appearance().backgroundImage = UIImage(named: K.backgroundPicture)
        tabBar.backgroundImage = UIImage(named: K.backgroundPicture)
        tabBar.standardAppearance.backgroundImage = UIImage(named: "woodenTableBackground.jpeg")
        tabBar.items?.first?.title = "Категории"
        tabBar.items?.last?.title = "Рецепты"
        tabBar.tintColor = UIColor(named: ColorSets.mainSysColor.rawValue)
        
    }
}
