//
//  Budget+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Budget {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Budget> {
        return NSFetchRequest<Budget>(entityName: "Budget")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var repeatFlag: Bool
    @NSManaged public var dateBegin: Date?
    @NSManaged public var dateEnd: Date?
    @NSManaged public var amount: Double
    @NSManaged public var categories: NSSet?
    @NSManaged public var repeatInterval: RepeatInterval?
    @NSManaged public var icon: Icon?
    @NSManaged public var journal: Journal?

}

// MARK: Generated accessors for categories
extension Budget {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Category)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Category)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}
