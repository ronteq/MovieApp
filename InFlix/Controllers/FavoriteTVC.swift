//
//  FavoriteTVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/23/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class FavoriteTVC: UITableViewController {
    
    fileprivate var favoriteMovies = [FavoriteMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchFavoriteMovies()
        tableView.reloadData()
    }
}

extension FavoriteTVC{
    fileprivate struct CellId{
        static let favoriteCellId = "favoriteCell"
    }
}

// MARK: -TableView Methods

extension FavoriteTVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.favoriteCellId, for: indexPath)
        
        let favoriteMovie = favoriteMovies[indexPath.row]
        cell.textLabel?.text = favoriteMovie.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let favoriteMovie = Movie(favoriteMovie: favoriteMovies[indexPath.row]) else { return }
        let movieDetailVC = MovieDetailVC()
        movieDetailVC.movie = favoriteMovie
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let movie = favoriteMovies[indexPath.row]
            deleteFavoriteMovie(movie)
            favoriteMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK -CoreData Methods

extension FavoriteTVC{
    fileprivate func fetchFavoriteMovies(){
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        favoriteMovies = FavoriteMovie.fetchMovies(withContext: context)
    }
    
    fileprivate func deleteFavoriteMovie(_ movie: FavoriteMovie){
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        FavoriteMovie.deleteMovie(movie, context: context)
    }
}
