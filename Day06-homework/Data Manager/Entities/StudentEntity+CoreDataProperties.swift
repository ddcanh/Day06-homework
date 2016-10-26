//
//  StudentEntity+CoreDataProperties.swift
//  Day06-homework
//
//  Created by Enrik on 10/25/16.
//  Copyright © 2016 Enrik. All rights reserved.
//

import Foundation
import CoreData


extension StudentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentEntity> {
        return NSFetchRequest<StudentEntity>(entityName: "StudentEntity");
    }

    @NSManaged public var address: String?
    @NSManaged public var birthday: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var image: NSData?
    @NSManaged public var classes: NSSet?

}

// MARK: Generated accessors for classes
extension StudentEntity {

    @objc(addClassesObject:)
    @NSManaged public func addToClasses(_ value: ClassEntity)

    @objc(removeClassesObject:)
    @NSManaged public func removeFromClasses(_ value: ClassEntity)

    @objc(addClasses:)
    @NSManaged public func addToClasses(_ values: NSSet)

    @objc(removeClasses:)
    @NSManaged public func removeFromClasses(_ values: NSSet)

}
