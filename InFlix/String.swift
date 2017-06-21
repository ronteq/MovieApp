//
//  String.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

extension String{
    
    func prepareStringForInflixAPI()-> String{
        var finalString = self.replacingOccurrences(of: " ", with: "%20")
        let lastIndex = finalString.endIndex
        
        if finalString.characters.count > 3{
            let indexFromLastThreeCharacters = finalString.index(lastIndex, offsetBy: -3)
            let lastThreeCharacters = finalString.substring(from: indexFromLastThreeCharacters)
            
            if lastThreeCharacters == "%20"{
                finalString = finalString.substring(to: indexFromLastThreeCharacters)
            }
        }
        
        return finalString
    }
    
}
