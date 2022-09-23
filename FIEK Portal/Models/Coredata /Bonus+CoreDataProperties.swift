//
//  Bonus+CoreDataProperties.swift
//  FIEK Portal
//
//  Created by Fisnik on 23/09/2022.
//
//

import Foundation
import CoreData


extension Bonus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bonus> {
        return NSFetchRequest<Bonus>(entityName: "Bonus")
    }

    @NSManaged public var course: String?
    @NSManaged public var value: Int64
    @NSManaged public var student: Student?

}

extension Bonus : Identifiable {

}
