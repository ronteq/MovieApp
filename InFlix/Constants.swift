//
//  Constants.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

struct Constants{
    struct APIEndpoints{
        static private let baseUrl = "http://netflixroulette.net/api/api.php"
        
        static func movieListUrl(withTitle title: String)-> String{
            return "\(baseUrl)?title=\(title)"
        }
        
        static func movieListUrl(withActor actor: String)-> String{
            return "\(baseUrl)?actor=\(actor)"
        }
        
        static func movieListUrl(withDirector director: String)-> String{
            return "\(baseUrl)?director=\(director)"
        }
    }
    
    struct CellIds{
        static let searchCellId = "mainCell"
    }
    
    struct Fonts{
        static let fontStyleForCells = "Helvetica-Light"
        static let fontSizeForCells = 18
    }
}
