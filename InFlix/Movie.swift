//
//  Movie.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class Movie{
    private var _title: String!
    private var _releaseYear: String!
    private var _rating: String!
    private var _category: String!
    private var _cast: [String]!
    private var _director: String!
    private var _posterUrl: String!
    private var _runtime: String!
    
    var title: String{
        if _title == nil{
            _title = ""
        }
        
        return _title
    }
    
    var releaseYear: String{
        if _releaseYear == nil{
            _releaseYear = ""
        }
        
        return _releaseYear
    }
    
    var rating: String{
        if _rating == nil{
            _rating = ""
        }
        
        return _rating
    }
    
    var category: String{
        if _category == nil{
            _category = ""
        }
        
        return _category
    }
    
    var cast: [String]{
        if _cast == nil{
            _cast = [String]()
        }
        
        return _cast
    }
    
    var director: String{
        if _director == nil{
            _director = ""
        }
        
        return _director
    }
    
    var posterUrl: String{
        if _posterUrl == nil{
            _posterUrl = ""
        }
        
        return _posterUrl
    }
    
    var runtime: String{
        if _runtime == nil{
            _runtime = ""
        }
        
        return _runtime
    }
    
    
}
