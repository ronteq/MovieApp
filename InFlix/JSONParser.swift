//
//  JSONParser.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

class JSONParser{
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
