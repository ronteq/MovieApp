//
//  Constants.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/19/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import UIKit

struct Constants{
    struct Fonts{
        static let fontStyleForNormalCells = "Helvetica-Light"
        static let fontStyleForTitleCells = "Helvetica-Bold"
        static let fontSizeForTitleCells: CGFloat = 18
        static let fontSizeForNormalCells: CGFloat = 14
        static let fontSizeForDetailCells: CGFloat = 12
    }
    
    struct ScreenSize{
        static let width: CGFloat = UIScreen.main.bounds.width
        static let height: CGFloat = UIScreen.main.bounds.height
    }
}
