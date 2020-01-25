//
//  Category+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
    return NSFetchRequest<Category>(entityName: "Category")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var rolloverFlag: Bool
  @NSManaged public var date: Date?
  @NSManaged public var transactionEntries: NSSet?
  @NSManaged public var budget: Budget?
  @NSManaged public var parent: Category?
  @NSManaged public var children: NSSet?
  @NSManaged public var icon: Icon?
  
  /// Aaron KoRn (c) 2020
  public var wrappedName: String {
    name ?? "[name]"
  }//wrappedName
  
  /// Aaron KoRn (c) 2020
  public var wrappedDate: String {
    // date currently as iso8601
    if let wrappedDate = self.dateDate {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      return formatter.string(from: wrappedDate)
    } else {
      return "06/09/69"
    }
  }//wrappedDate
  
  /// Aaron KoRn (c) 2020
  public var childrenArray: [Category] {
    let set = children as? Set<Category> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//childrenArray
  
  /// Aaron KoRn (c) 2020
  public var transactionEntriesArray: [TransactionEntry] {
    let set = transactionEntries as? Set<TransactionEntry> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//transactionEntriesArray
  
}//extension TransactionEntry

// MARK: Generated accessors for transactionEntries
extension Category {
  
  @objc(addTransactionEntriesObject:)
  @NSManaged public func addToTransactionEntries(_ value: TransactionEntry)
  
  @objc(removeTransactionEntriesObject:)
  @NSManaged public func removeFromTransactionEntries(_ value: TransactionEntry)
  
  @objc(addTransactionEntries:)
  @NSManaged public func addToTransactionEntries(_ values: NSSet)
  
  @objc(removeTransactionEntries:)
  @NSManaged public func removeFromTransactionEntries(_ values: NSSet)
  
}

// MARK: Generated accessors for children
extension Category {
  
  @objc(addChildrenObject:)
  @NSManaged public func addToChildren(_ value: Category)
  
  @objc(removeChildrenObject:)
  @NSManaged public func removeFromChildren(_ value: Category)
  
  @objc(addChildren:)
  @NSManaged public func addToChildren(_ values: NSSet)
  
  @objc(removeChildren:)
  @NSManaged public func removeFromChildren(_ values: NSSet)
  
}
