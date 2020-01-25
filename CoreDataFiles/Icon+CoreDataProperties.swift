//
//  Icon+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Icon {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Icon> {
    return NSFetchRequest<Icon>(entityName: "Icon")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var accounts: Account?
  @NSManaged public var budgets: Budget?
  @NSManaged public var categories: Category?
  @NSManaged public var journals: Journal?
  @NSManaged public var repeatIntervals: RepeatInterval?
  @NSManaged public var transactions: Transaction?
  @NSManaged public var transactionEntries: TransactionEntry?
  @NSManaged public var payments: Payment?
  
  /// Aaron KoRn (c) 2020
  public var wrappedName: String {
    name ?? "[name]"
  }
}
