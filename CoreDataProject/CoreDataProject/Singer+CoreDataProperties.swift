//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Павел Грицков on 17.09.23.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        firstName ?? "Unknow"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknow"
    }
}

extension Singer : Identifiable {

}
