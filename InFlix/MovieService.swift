//
//  MovieService.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class MovieService{
    static func fetchMovie(withTitle searchText: String, completion: @escaping(_ movie: Movie?, _ errorMessage: String?)-> Void){
        guard let url = URL(string: APIEndpoints.movieListUrl(withTitle: searchText)) else { return }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                completion(nil, error.localizedDescription)
            }else{
                
                if let httpResponse = response as? HTTPURLResponse, let responseCode = HttpResponseCode(rawValue: httpResponse.statusCode) {
                    if let data = data{
                        let json = JSONParser.decodeJsonFromData(data: data)
                        
                        switch responseCode {
                        case .success:
                            let movie = Movie(dictionary: json)
                            completion(movie, nil)
                            
                        case .notFound:
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                            
                        case .serverError:
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                            
                        case .badInputLength:
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                        }
                    }
                }
                
            }
            
        }.resume()
    }
    
    static func fetchMovies(withActor searchText: String, completion: @escaping(_ movies: [Movie]?, _ errorMessage: String?)-> Void){
        guard let url = URL(string: APIEndpoints.movieListUrl(withActor: searchText)) else { return }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                completion(nil, error.localizedDescription)
            }else{
                
                if let httpResponse = response as? HTTPURLResponse, let responseCode = HttpResponseCode(rawValue: httpResponse.statusCode) {
                    if let data = data{
                        
                        switch responseCode {
                        case .success:
                            let jsonArray = JSONParser.decodeJsonArrayFromData(data: data)
                            let movies = Movie.getMovieListFromArray(jsonArray)
                            completion(movies, nil)
                            
                        case .notFound:
                            let json = JSONParser.decodeJsonFromData(data: data)
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                            
                        case .serverError:
                            let json = JSONParser.decodeJsonFromData(data: data)
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                            
                        case .badInputLength:
                            let json = JSONParser.decodeJsonFromData(data: data)
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                        }
                    }
                }
                
            }
            
        }.resume()
    }
    
    static func fetchMovies(withDirector searchText: String, completion: @escaping(_ movies: [Movie]?, _ errorMessage: String?)-> Void){
        guard let url = URL(string: APIEndpoints.movieListUrl(withDirector: searchText)) else { return }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                completion(nil, error.localizedDescription)
            }else{
                
                if let httpResponse = response as? HTTPURLResponse, let responseCode = HttpResponseCode(rawValue: httpResponse.statusCode) {
                    if let data = data{
                        
                        switch responseCode {
                        case .success:
                            let jsonArray = JSONParser.decodeJsonArrayFromData(data: data)
                            let movies = Movie.getMovieListFromArray(jsonArray)
                            completion(movies, nil)
                            
                        case .notFound:
                            let json = JSONParser.decodeJsonFromData(data: data)
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                            
                        case .serverError:
                            let json = JSONParser.decodeJsonFromData(data: data)
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                            
                        case .badInputLength:
                            let json = JSONParser.decodeJsonFromData(data: data)
                            let errorMessage = getErrorMessage(from: json)
                            completion(nil, errorMessage)
                        }
                    }
                }
                
            }
            
        }.resume()
    }
    
    fileprivate static func getErrorMessage(from dictionary: [String: AnyObject])-> String{
        if let errorMessage = dictionary["message"] as? String{
            return errorMessage
        }else{
            return "Generic Error"
        }
    }
}

extension MovieService {
    fileprivate enum HttpResponseCode : Int {
        case success = 200
        case badInputLength = 400
        case notFound = 404
        case serverError = 500
    }
}
