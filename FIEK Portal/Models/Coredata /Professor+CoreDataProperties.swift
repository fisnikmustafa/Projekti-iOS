//
//  Professor+CoreDataProperties.swift
//  FIEK Portal
//
//  Created by Fisnik on 23/09/2022.
//
//

import Foundation
import CoreData


extension Professor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Professor> {
        return NSFetchRequest<Professor>(entityName: "Professor")
    }

    @NSManaged public var firstCourse: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var secondCourse: String?
    @NSManaged public var username: String?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension Professor {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

extension Professor : Identifiable {

}
