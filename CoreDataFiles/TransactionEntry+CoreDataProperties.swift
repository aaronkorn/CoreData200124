//
//  TransactionEntry+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension TransactionEntry {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionEntry> {
    return NSFetchRequest<TransactionEntry>(entityName: "TransactionEntry")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var amount: Double
  @NSManaged public var transaction: Transaction?
  @NSManaged public var category: Category?
  @NSManaged public var icon: Icon?
  @NSManaged public var journal: Journal?
  
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
  
}//extension TransactionEntry
