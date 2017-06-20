//
//  String.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/20/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation

extension String{
    
    func prepareStringForUrl()-> String{
        let finalString = self.replacingOccurrences(of: " ", with: "%20")
        return finalString
    }
    
}
