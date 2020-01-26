//
//  Payment+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Payment {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Payment> {
    return NSFetchRequest<Payment>(entityName: "Payment")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var checkNumber: Int32
  @NSManaged public var icon: Icon?
  @NSManaged public var account: Account?
  @NSManaged public var transaction: Transaction?
  
  /// Aaron KoRn (c) 2020
  public var wrappedIcon: String {
    if let wrappedIcon = self.icon {
      return wrappedIcon.wrappedName
    } else {
      return "ant.circle.fill"
    }
  }//wrappedIcon
  
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
  
}//extension TransactionEntry
