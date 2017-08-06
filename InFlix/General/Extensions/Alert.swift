//
//  Alerts.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

extension UIViewController  {
    
    func createAlert(withMessage message: String)-> UIAlertController{
        let alert = UIAlertController(title: "InFlix", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
    
}
