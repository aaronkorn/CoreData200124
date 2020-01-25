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
  public var wrappedName: String {
    name ?? "[name]"
  }//wrappedName
}
