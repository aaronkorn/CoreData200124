//
//  Transaction+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Transaction {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
    return NSFetchRequest<Transaction>(entityName: "Transaction")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var archiveFlag: Bool
  @NSManaged public var automateFlag: Bool
  @NSManaged public var totalAmount: Double
  @NSManaged public var clearDate: Date?
  @NSManaged public var clearFlag: Bool
  @NSManaged public var paidFlag: Bool
  @NSManaged public var paidDate: Date?
  @NSManaged public var transactionEntries: NSSet?
  @NSManaged public var icon: Icon?
  @NSManaged public var repeatInterval: RepeatInterval?
  @NSManaged public var payments: Payment?
  
  /// Aaron KoRn (c) 2020
  public var wrappedName: String {
    name ?? "[name]"
  }
  /// Aaron KoRn (c) 2020
  public var transactionEntriesArray: [TransactionEntry] {
    let set = transactionEntries as? Set<TransactionEntry> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//transactionEntriesArray
}

// MARK: Generated accessors for transactionEntries
extension Transaction {
  
  @objc(addTransactionEntriesObject:)
  @NSManaged public func addToTransactionEntries(_ value: TransactionEntry)
  
  @objc(removeTransactionEntriesObject:)
  @NSManaged public func removeFromTransactionEntries(_ value: TransactionEntry)
  
  @objc(addTransactionEntries:)
  @NSManaged public func addToTransactionEntries(_ values: NSSet)
  
  @objc(removeTransactionEntries:)
  @NSManaged public func removeFromTransactionEntries(_ values: NSSet)
  
}
