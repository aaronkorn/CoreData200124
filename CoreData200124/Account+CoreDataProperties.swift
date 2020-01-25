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
  public var wrappedName: String {
    name ?? "[name]"
  }
  /// Aaron KoRn (c) 2020
  public var paymentsArray: [Payment] {
    let set = payments as? Set<Payment> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//childrenArray
}

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
  
}
