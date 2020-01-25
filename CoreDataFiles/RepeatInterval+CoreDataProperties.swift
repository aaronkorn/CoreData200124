//
//  RepeatInterval+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension RepeatInterval {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<RepeatInterval> {
    return NSFetchRequest<RepeatInterval>(entityName: "RepeatInterval")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var dayMonthYear: String?
  @NSManaged public var everyNumber: Int16
  @NSManaged public var monthYear: String?
  @NSManaged public var everyType: String?
  @NSManaged public var budgets: NSSet?
  @NSManaged public var icon: Icon?
  @NSManaged public var transactions: NSSet?
  
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
  public var budgetsArray: [Budget] {
    let set = budgets as? Set<Budget> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//budgetsArray
  
  /// Aaron KoRn (c) 2020
  public var transactionsArray: [Transaction] {
    let set = transactions as? Set<Transaction> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//transactionsArray
  
}//extension Journal

// MARK: Generated accessors for budgets
extension RepeatInterval {
  
  @objc(addBudgetsObject:)
  @NSManaged public func addToBudgets(_ value: Budget)
  
  @objc(removeBudgetsObject:)
  @NSManaged public func removeFromBudgets(_ value: Budget)
  
  @objc(addBudgets:)
  @NSManaged public func addToBudgets(_ values: NSSet)
  
  @objc(removeBudgets:)
  @NSManaged public func removeFromBudgets(_ values: NSSet)
  
}

// MARK: Generated accessors for transactions
extension RepeatInterval {
  
  @objc(addTransactionsObject:)
  @NSManaged public func addToTransactions(_ value: Transaction)
  
  @objc(removeTransactionsObject:)
  @NSManaged public func removeFromTransactions(_ value: Transaction)
  
  @objc(addTransactions:)
  @NSManaged public func addToTransactions(_ values: NSSet)
  
  @objc(removeTransactions:)
  @NSManaged public func removeFromTransactions(_ values: NSSet)
  
}
