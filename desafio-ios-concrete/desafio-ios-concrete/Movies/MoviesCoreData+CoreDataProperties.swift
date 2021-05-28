//
//  MoviesCoreData+CoreDataProperties.swift
//  
//
//  Created by Alexandre Cardoso on 27/05/21.
//
//

import Foundation
import CoreData


extension MoviesCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesCoreData> {
        return NSFetchRequest<MoviesCoreData>(entityName: "MoviesCoreData")
    }

    @NSManaged public var genres: [Int]?
    @NSManaged public var title: String?
    @NSManaged public var summary: String?
    @NSManaged public var poster: String?
    @NSManaged public var release_data: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var poster_url: String?
    @NSManaged public var release_year: String?
    @NSManaged public var genres_description: String?

}
