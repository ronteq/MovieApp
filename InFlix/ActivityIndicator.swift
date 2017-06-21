//
//  ActivityIndicator.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/21/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

struct ActivityIndicator{
    
    var activityIndicator: UIActivityIndicatorView!
    
    mutating func launchInView(_ view: UIView){
        activityIndicator = UIActivityIndicatorView(frame: view.frame)
        activityIndicator.backgroundColor = ColorPalette.activityIndicatorColor
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    mutating func stop(){
        activityIndicator.stopAnimating()
        activityIndicator = nil
    }
}
