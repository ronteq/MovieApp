//
//  MovieService.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class MovieService{
    static func getMovies(withTitle title: String, completion: @escaping(_ movie: Movie?, _ errorMessage: String?)-> Void){
        let url = URL(string: Constants.APIEndpoints.movieListUrl(withTitle: title))
        var request = URLRequest(url: url!)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print("Error when trying to get the movies. \(error!.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                switch httpResponse.statusCode{
                case 200:
                    if let data = data{
                        let json = GeneralMethods.decodeJsonFromData(data: data)
                        let movie = Movie(dictionary: json)
                        
                        completion(movie, nil)
                    }
                case 404: completion(nil, "Sorry! We couldn't find a movie with that title")
                default: break
                }
            }
            
            
        }.resume()
    }
}
