//
//  Student+CoreDataProperties.swift
//  FIEK Portal
//
//  Created by Fisnik on 23/09/2022.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var firstCourseAttendance: Int64
    @NSManaged public var name: String?
    @NSManaged public var projectPoints: Int64
    @NSManaged public var secondCourseAttendance: Int64
    @NSManaged public var bonusPoints: NSSet?
    @NSManaged public var professor: Professor?

}

// MARK: Generated accessors for bonusPoints
extension Student {

    @objc(addBonusPointsObject:)
    @NSManaged public func addToBonusPoints(_ value: Bonus)

    @objc(removeBonusPointsObject:)
    @NSManaged public func removeFromBonusPoints(_ value: Bonus)

    @objc(addBonusPoints:)
    @NSManaged public func addToBonusPoints(_ values: NSSet)

    @objc(removeBonusPoints:)
    @NSManaged public func removeFromBonusPoints(_ values: NSSet)

}

extension Student : Identifiable {

}
