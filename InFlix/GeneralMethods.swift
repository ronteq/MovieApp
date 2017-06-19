//
//  GeneralMethods.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

class GeneralMethods{
    
    static func createAlert(withMessage message: String)-> UIAlertController{
        let alert = UIAlertController(title: "InFlix", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
    
    static func prepareStringForUrl(_ initialString: String)-> String{
        let finalString = initialString.replacingOccurrences(of: " ", with: "%20")
        return finalString
    }
    
    static func decodeJsonFromData(data: Data)-> [String: AnyObject]{
        var json = [String: AnyObject]()
        
        do{
            json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: AnyObject]
        }catch{
            print("Error when trying to convert to JSON, \(error.localizedDescription)")
        }
        
        return json
    }
    
    static func decodeJsonArrayFromData(data: Data)-> [[String: AnyObject]]{
        var jsonArray = [[String: AnyObject]]()
        
        do{
            jsonArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String: AnyObject]]
        }catch{
            print("Error when trying to convert to JSON, \(error.localizedDescription)")
        }
        
        return jsonArray
    }
}
