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
    private var _cast: String!
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
    
    var cast: String{
        if _cast == nil{
            _cast = String()
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
    
    init(title: String, releaseYear: String, rating: String, category: String, cast: String, director: String, posterUrl: String, runtime: String) {
        _title = title
        _releaseYear = releaseYear
        _rating = rating
        _category = category
        _cast = cast
        _director = director
        _posterUrl = posterUrl
        _runtime = runtime
    }
    
    convenience init(dictionary: [String: AnyObject]){
        
        guard let title = dictionary["show_title"] as? String,
            let releaseYear = dictionary["release_year"] as? String,
            let rating = dictionary["rating"] as? String,
            let category = dictionary["category"] as? String,
            let cast = dictionary["show_cast"] as? String,
            let director = dictionary["director"] as? String,
            let posterUrl = dictionary["poster"] as? String,
            let runtime = dictionary["runtime"] as? String else{
                self.init(title: "", releaseYear: "", rating: "", category: "", cast: "", director: "", posterUrl: "", runtime: "")
                return
        }
        
        self.init(title: title, releaseYear: releaseYear, rating: rating, category: category, cast: cast, director: director, posterUrl: posterUrl
            , runtime: runtime)
        
    }
}
