//
//  Movie.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class Movie{
    var title: String?
    var releaseYear: String?
    var rating: String?
    var category: String?
    var cast: String?
    var director: String?
    var posterUrl: String?
    var runtime: String?
    
    init(title: String, releaseYear: String, rating: String, category: String, cast: String, director: String, posterUrl: String, runtime: String) {
        self.title = title
        self.releaseYear = releaseYear
        self.rating = rating
        self.category = category
        self.cast = cast
        self.director = director
        self.posterUrl = posterUrl
        self.runtime = runtime
    }
    
    convenience init(dictionary: [String: AnyObject]){
        
        guard let title = dictionary[JSONKeys.showTitle] as? String,
            let releaseYear = dictionary[JSONKeys.releaseYear] as? String,
            let rating = dictionary[JSONKeys.rating] as? String,
            let category = dictionary[JSONKeys.category] as? String,
            let cast = dictionary[JSONKeys.showCast] as? String,
            let director = dictionary[JSONKeys.director] as? String,
            let posterUrl = dictionary[JSONKeys.posterUrl] as? String,
            let runtime = dictionary[JSONKeys.runtime] as? String else{
                self.init(title: "", releaseYear: "", rating: "", category: "", cast: "", director: "", posterUrl: "", runtime: "")
                return
        }
        
        self.init(title: title, releaseYear: releaseYear, rating: rating, category: category, cast: cast, director: director, posterUrl: posterUrl
            , runtime: runtime)
        
    }
    
    static func getMovieListFromArray(_ arrayDictionary: [[String: AnyObject]])-> [Movie]{
        var movies = [Movie]()
        
        for dictionary in arrayDictionary{
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}

fileprivate struct JSONKeys{
    static let showTitle = "show_title"
    static let releaseYear = "release_year"
    static let rating = "rating"
    static let category = "category"
    static let showCast = "show_cast"
    static let director = "director"
    static let posterUrl = "poster"
    static let runtime = "runtime"
}




