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
  @NSManaged public var date: Date?
  @NSManaged public var dateBegin: Date?
  @NSManaged public var dateEnd: Date?
  @NSManaged public var amount: Double
  @NSManaged public var categories: NSSet?
  @NSManaged public var repeatInterval: RepeatInterval?
  @NSManaged public var icon: Icon?
  @NSManaged public var journal: Journal?
  
  /// Aaron KoRn (c) 2020
  public var wrappedName: String {
    name ?? "[name]"
  }//wrappedName
  
  /// Aaron KoRn (c) 2020
  public var wrappedDate: String {
    // date currently as iso8601
    if let wrappedDate = self.date {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      return formatter.string(from: wrappedDate)
    } else {
      return "06/09/69"
    }
  }//wrappedDate
  
  /// Aaron KoRn (c) 2020
  public var categoriesArray: [Category] {
    let set = categories as? Set<Category> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//categoriesArray
  
}//extension Account

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
