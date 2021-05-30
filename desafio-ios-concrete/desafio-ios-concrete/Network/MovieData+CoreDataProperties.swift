//
//  MovieData+CoreDataProperties.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//
//

import Foundation
import CoreData


extension MovieData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieData> {
        return NSFetchRequest<MovieData>(entityName: "MovieData")
    }

    @NSManaged public var genres: [Int]?
    @NSManaged public var genres_description: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var poster: String?
    @NSManaged public var release_data: String?
    @NSManaged public var summary: String?
    @NSManaged public var title: String?

}

extension MovieData : Identifiable {

}
