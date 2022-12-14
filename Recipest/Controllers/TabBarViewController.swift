//
//  TabBarViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
//MARK: - Public Properties
    var data: [DataBase] = []
    
    //MARK: - VC Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSetup()
        tabBarSetup()
    }

   //MARK: - Private Methods
    private func navBarSetup() {
        
        navigationController?.navigationBar.tintColor = UIColor(named: ColorSets.mainSysColor.rawValue)
    }
    private func tabBarSetup() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: K.mainSystemFont, size: 20)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: K.mainSystemFont, size: 20)!], for: .selected)
        UITabBar.appearance().backgroundImage = UIImage(named: K.backgroundPicture)
        tabBar.backgroundImage = UIImage(named: K.backgroundPicture)
        tabBar.standardAppearance.backgroundImage = UIImage(named: K.backgroundPicture)
        tabBar.items?.first?.title = "Категории"
        tabBar.items?.last?.title = "Рецепты"
        tabBar.tintColor = UIColor(named: ColorSets.mainSysColor.rawValue)
        
    }
}
