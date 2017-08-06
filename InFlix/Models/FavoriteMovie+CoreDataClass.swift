//
//  FavoriteMovie+CoreDataClass.swift
//  InFlix
//
//  Created by Daniel Fernandez on 6/23/17.
//  Copyright © 2017 Daniel Fernandez. All rights reserved.
//

import Foundation
import CoreData


public class FavoriteMovie: NSManagedObject {
    @NSManaged public var title: String?
    @NSManaged public var releaseYear: String?
    @NSManaged public var rating: String?
    @NSManaged public var category: String?
    @NSManaged public var cast: String?
    @NSManaged public var director: String?
    @NSManaged public var summary: String?
    @NSManaged public var posterUrl: String?
    @NSManaged public var runtime: String?
}
