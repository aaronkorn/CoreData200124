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
    @NSManaged public var icon: Icon?
    @NSManaged public var transactionEntries: NSSet?
    @NSManaged public var budgets: NSSet?

}

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
