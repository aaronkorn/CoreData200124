//
//  Journal+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Journal {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
    return NSFetchRequest<Journal>(entityName: "Journal")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var icon: Icon?
  @NSManaged public var transactionEntries: NSSet?
  @NSManaged public var budgets: NSSet?
  
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
  public var transactionEntriesArray: [TransactionEntry] {
    let set = transactionEntries as? Set<TransactionEntry> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//transactionEntriesArray
  
  /// Aaron KoRn (c) 2020
  public var budgetsArray: [Budget] {
    let set = budgets as? Set<Budget> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//budgetsArray
  
}//extension Journal

// MARK: Generated accessors for transactionEntries
extension Journal {
  
  @objc(addTransactionEntriesObject:)
  @NSManaged public func addToTransactionEntries(_ value: TransactionEntry)
  
  @objc(removeTransactionEntriesObject:)
  @NSManaged public func removeFromTransactionEntries(_ value: TransactionEntry)
  
  @objc(addTransactionEntries:)
  @NSManaged public func addToTransactionEntries(_ values: NSSet)
  
  @objc(removeTransactionEntries:)
  @NSManaged public func removeFromTransactionEntries(_ values: NSSet)
  
}

// MARK: Generated accessors for budgets
extension Journal {
  
  @objc(addBudgetsObject:)
  @NSManaged public func addToBudgets(_ value: Budget)
  
  @objc(removeBudgetsObject:)
  @NSManaged public func removeFromBudgets(_ value: Budget)
  
  @objc(addBudgets:)
  @NSManaged public func addToBudgets(_ values: NSSet)
  
  @objc(removeBudgets:)
  @NSManaged public func removeFromBudgets(_ values: NSSet)
  
}
