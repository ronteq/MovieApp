//
//  MoviesVC.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController {
    
    var movie: Movie? {
        didSet{
            if let movie = movie{
                print(movie.title)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
