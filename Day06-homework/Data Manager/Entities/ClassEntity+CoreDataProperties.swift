//
//  ClassEntity+CoreDataProperties.swift
//  Day06-homework
//
//  Created by Enrik on 10/25/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import Foundation
import CoreData

extension ClassEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClassEntity> {
        return NSFetchRequest<ClassEntity>(entityName: "ClassEntity");
    }

    @NSManaged public var name: String?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension ClassEntity {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: StudentEntity)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: StudentEntity)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}
