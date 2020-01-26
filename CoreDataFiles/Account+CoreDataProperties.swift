//
//  Account+CoreDataProperties.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Account {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
    return NSFetchRequest<Account>(entityName: "Account")
  }
  
  @NSManaged public var id: UUID?
  @NSManaged public var name: String?
  @NSManaged public var date: Date?
  @NSManaged public var icon: Icon?
  @NSManaged public var payments: NSSet?
  
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
  
  /// Aaron KoRn (c) 2020
  public var paymentsArray: [Payment] {
    let set = payments as? Set<Payment> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//paymentsArray
  
}//extension Account

// MARK: Generated accessors for payments
extension Account {
  
  @objc(addPaymentsObject:)
  @NSManaged public func addToPayments(_ value: Payment)
  
  @objc(removePaymentsObject:)
  @NSManaged public func removeFromPayments(_ value: Payment)
  
  @objc(addPayments:)
  @NSManaged public func addToPayments(_ values: NSSet)
  
  @objc(removePayments:)
  @NSManaged public func removeFromPayments(_ values: NSSet)
  
}//Account
