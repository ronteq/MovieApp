//
//  FavoriteMovie+CoreDataProperties.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/23/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation
import CoreData


extension FavoriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovie> {
        return NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
    }
    
    static func saveMovie(context: NSManagedObjectContext, movie: Movie){
        let favoriteMovie = FavoriteMovie(context: context)
        favoriteMovie.title = movie.title
        favoriteMovie.cast = movie.cast
        favoriteMovie.category = movie.category
        favoriteMovie.director = movie.director
        favoriteMovie.posterUrl = movie.posterUrl
        favoriteMovie.rating = movie.rating
        favoriteMovie.releaseYear = movie.releaseYear
        favoriteMovie.runtime = movie.runtime
        favoriteMovie.summary = movie.summary
        
        saveContext(context)
    }
    
    static func fetchMovies(withContext context: NSManagedObjectContext)-> [FavoriteMovie]{
        var favorites = [FavoriteMovie]()
        
        do{
            favorites = try context.fetch(FavoriteMovie.fetchRequest())
        }catch{
            print(error.localizedDescription)
        }
        
        return favorites
    }
    
    static func fetchMovie(withTitle title: String, context: NSManagedObjectContext)-> FavoriteMovie?{
        let request: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        request.predicate = NSPredicate(format: "title = %@", title)
        
        do{
            let matches = try context.fetch(request)
            if matches.count > 0{
                return matches[0]
            }
        }catch{
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    static func movieIsFavorite(withTitle title: String, context: NSManagedObjectContext)-> Bool{
        let request: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        request.predicate = NSPredicate(format: "title = %@", title)
        
        do{
            let matches = try context.fetch(request)
            if matches.count > 0{
                return true
            }
        }catch{
            print(error.localizedDescription)
        }
        
        return false
    }
    
    static func deleteMovie(withTitle title: String, context: NSManagedObjectContext){
        guard let movie = fetchMovie(withTitle: title, context: context) else { return }
        context.delete(movie)
        saveContext(context)
    }
    
    static func deleteMovie(_ movie: FavoriteMovie, context: NSManagedObjectContext){
        context.delete(movie)
        saveContext(context)
    }
    
    static fileprivate func saveContext(_ context: NSManagedObjectContext){
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
}
