//
//  MovieHomeVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class MovieHomeVC: UIViewController {
    
    @IBOutlet private weak var searchTextField: UITextField!

    var placeholder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPlaceholderForTextField()
    }
    
    private func setupPlaceholderForTextField(){
        searchTextField.placeholder = placeholder
    }
}

/*
@IBAction func searchMovie(){
    guard let titleStringWithSpaces = movieTextField.text, let actorStringWithSpaces = actorTextField.text, let directorStringWithSpaces = directorTextField.text else{
        return
    }
    
    if titleStringWithSpaces.isEmpty && actorStringWithSpaces.isEmpty && directorStringWithSpaces.isEmpty{
        let alert = GeneralMethods.createAlert(withMessage: "Please fill in at least one of the text fields")
        present(alert, animated: true, completion: nil)
    }else{
        let title = GeneralMethods.prepareStringForUrl(titleStringWithSpaces)
        let actor = GeneralMethods.prepareStringForUrl(actorStringWithSpaces)
        let director = GeneralMethods.prepareStringForUrl(directorStringWithSpaces)
        
        fetchMovies(title: title, actor: actor, director: director)
    }
}

private func fetchMovies(title: String, actor: String, director: String){
    MovieService.getMovies(withTitle: title){ (movie, errorMessage) in
        
        OperationQueue.main.addOperation {
            if let message = errorMessage{
                let alert = GeneralMethods.createAlert(withMessage: message)
                self.present(alert, animated: true, completion: nil)
            }else{
                self.movie = movie
                //                    self.goToMoviesVC()
            }
        }
    }
}

*/
