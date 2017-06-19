//
//  MovieService.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class MovieService{
    static func getMovies(withTitle title: String, completion: @escaping(_ movies: [Movie])-> Void){
        let url = URL(string: Constants.APIEndpoints.movieListUrl(withTitle: title))
        var request = URLRequest(url: url!)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print("Error when trying to get the movies. \(error!.localizedDescription)")
            }
            
            if let data = data{
                //TODO: Parse the data from an array of JSON or a single JSON object
                completion([Movie]())
            }
        }.resume()
    }
}

/*init para movie acoder, convenience (parsear)
 pushear, rama por funcionalidad
 */
