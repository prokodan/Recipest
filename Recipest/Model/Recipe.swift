//
//  Recipe.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import Foundation

struct Recipe {
    
    let id: Int
    let category: Category
    let cuisine: Cuisine
    let name: String
    let description: String
    let image: String
    let ingredients: [Ingredients]
    let method: [Method]
    let cookingTime: Int
    let servingsMin: Int
    let servingsMax: Int
    var servings: String {
        "\(servingsMin) - \(servingsMax)"
        
    }
    
    var difficulty: String {
        
        switch cookingTime {
        case 0..<20:
            return "Очень легко"
        case 20..<40:
            return "Легко"
        case 40..<80:
            return "Средне"
        default:
            return "Сложно"
        }
    }
    
}

    
struct DataBase {
    
    var name: Category
    var recipe: [Recipe]
    
}


struct Ingredients {
    
    let ingredient: String
    let count: String
    
}

struct Method {
    
    var numberOfStep: Int
    let description: String
    
}

enum Category: String {
    
    case firstСourse = "Первое"
    case secondCourse = "Второе"
    case dessert = "Дессерт"
    case bake = "Выпечка"
    
}


enum Cuisine: String {
    
    case slavic = "Cлавянская кухня"
    case asian = "Азиатская кухня"
    case west = "Западная кухня"
    case europe = "Европейская кухня"
    
}

