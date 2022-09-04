//
//  K.swift
//  Recipest
//
//  Created by Данил Прокопенко on 29.08.2022.
//

import Foundation

struct K {

    static let mainSystemFont = "OrelegaOne-Regular"
    static let authorPicture = "authorPicture"
    static let backgroundPicture = "woodenTableBackground.jpeg"
    static let cell = "RecipeCell"
    static let mCell = "methodCell"
    static let iCell = "ingredientCell"
    
    
    
}

enum ColorSets: String {
    
    case mainSysColor = "mainSystemFontColor"
}

enum RecipesPhoto: String {
    
    case borsch = "borsch"
    case uha = "uha"
    case lagman = "lagman"
    case frenchMeat = "myasoPoFrancuzski"
    case burger = "hamburger"
    case pizza = "margaritaPizza"
    case pumpkinpie = "TykvennyiPirog"
    case honeypie = "medovik"
    case souffle = "sufle"
    
}

enum SegueIdentifier: String {
    case greettotab = "toTabBar"
    case greettoauthor = "toAuthor"
    
}
