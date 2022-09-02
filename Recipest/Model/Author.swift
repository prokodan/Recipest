//
//  Author.swift
//  Recipest
//
//  Created by Данил Прокопенко on 29.08.2022.
//

import Foundation


struct Author {
    
    let name: String
    let surname: String
    let jobTitle: String
    let photo: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
}

extension Author {
    
    static func getAuthorName() -> Author {
        
        let author = Author(name: "Данил", surname: "Прокопенко", jobTitle: "Начинающий iOS разработчик", photo: K.authorPicture)
        
        
        return author
    }
    
}
