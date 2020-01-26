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
  @NSManaged public var accounts: NSSet?
  @NSManaged public var budgets: NSSet?
  @NSManaged public var categories: NSSet?
  @NSManaged public var journals: NSSet?
  @NSManaged public var payments: NSSet?
  @NSManaged public var repeatIntervals: NSSet?
  @NSManaged public var transactionEntries: NSSet?
  @NSManaged public var transactions: NSSet?
  
  /// Aaron KoRn (c) 2020
  public var wrappedIcon: String {
    name ?? "ant.circle.fill"
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
  public var accountsArray: [Account] {
    let set = accounts as? Set<Account> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//accountsArray
  
  /// Aaron KoRn (c) 2020
  public var budgetsArray: [Budget] {
    let set = budgets as? Set<Budget> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//budgetsArray
  
  /// Aaron KoRn (c) 2020
  public var categoriesArray: [Category] {
    let set = categories as? Set<Category> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//categoriesArray
  
  /// Aaron KoRn (c) 2020
  public var journalsArray: [Journal] {
    let set = journals as? Set<Journal> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//journalsArray
  
  /// Aaron KoRn (c) 2020
  public var paymentsArray: [Payment] {
    let set = payments as? Set<Payment> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//paymentsArray
  
  /// Aaron KoRn (c) 2020
  public var repeatIntervalsArray: [RepeatInterval] {
    let set = repeatIntervals as? Set<RepeatInterval> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//repeatIntervalsArray
  
  /// Aaron KoRn (c) 2020
  public var transactionEntriesArray: [TransactionEntry] {
    let set = transactionEntries as? Set<TransactionEntry> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//transactionEntriesArray
  
  /// Aaron KoRn (c) 2020
  public var transactionsArray: [Transaction] {
    let set = transactions as? Set<Transaction> ?? []
    return set.sorted {
      $0.wrappedName < $1.wrappedName
    }
  }//transactionsArray
  
}//extension Icon

// MARK: Generated accessors for accounts
extension Icon {
  
  @objc(addAccountsObject:)
  @NSManaged public func addToAccounts(_ value: Account)
  
  @objc(removeAccountsObject:)
  @NSManaged public func removeFromAccounts(_ value: Account)
  
  @objc(addAccounts:)
  @NSManaged public func addToAccounts(_ values: NSSet)
  
  @objc(removeAccounts:)
  @NSManaged public func removeFromAccounts(_ values: NSSet)
  
}

// MARK: Generated accessors for budgets
extension Icon {
  
  @objc(addBudgetsObject:)
  @NSManaged public func addToBudgets(_ value: Budget)
  
  @objc(removeBudgetsObject:)
  @NSManaged public func removeFromBudgets(_ value: Budget)
  
  @objc(addBudgets:)
  @NSManaged public func addToBudgets(_ values: NSSet)
  
  @objc(removeBudgets:)
  @NSManaged public func removeFromBudgets(_ values: NSSet)
  
}

// MARK: Generated accessors for categories
extension Icon {
  
  @objc(addCategoriesObject:)
  @NSManaged public func addToCategories(_ value: Category)
  
  @objc(removeCategoriesObject:)
  @NSManaged public func removeFromCategories(_ value: Category)
  
  @objc(addCategories:)
  @NSManaged public func addToCategories(_ values: NSSet)
  
  @objc(removeCategories:)
  @NSManaged public func removeFromCategories(_ values: NSSet)
  
}

// MARK: Generated accessors for journals
extension Icon {
  
  @objc(addJournalsObject:)
  @NSManaged public func addToJournals(_ value: Journal)
  
  @objc(removeJournalsObject:)
  @NSManaged public func removeFromJournals(_ value: Journal)
  
  @objc(addJournals:)
  @NSManaged public func addToJournals(_ values: NSSet)
  
  @objc(removeJournals:)
  @NSManaged public func removeFromJournals(_ values: NSSet)
  
}

// MARK: Generated accessors for payments
extension Icon {
  
  @objc(addPaymentsObject:)
  @NSManaged public func addToPayments(_ value: Payment)
  
  @objc(removePaymentsObject:)
  @NSManaged public func removeFromPayments(_ value: Payment)
  
  @objc(addPayments:)
  @NSManaged public func addToPayments(_ values: NSSet)
  
  @objc(removePayments:)
  @NSManaged public func removeFromPayments(_ values: NSSet)
  
}

// MARK: Generated accessors for repeatIntervals
extension Icon {
  
  @objc(addRepeatIntervalsObject:)
  @NSManaged public func addToRepeatIntervals(_ value: RepeatInterval)
  
  @objc(removeRepeatIntervalsObject:)
  @NSManaged public func removeFromRepeatIntervals(_ value: RepeatInterval)
  
  @objc(addRepeatIntervals:)
  @NSManaged public func addToRepeatIntervals(_ values: NSSet)
  
  @objc(removeRepeatIntervals:)
  @NSManaged public func removeFromRepeatIntervals(_ values: NSSet)
  
}

// MARK: Generated accessors for transactionEntries
extension Icon {
  
  @objc(addTransactionEntriesObject:)
  @NSManaged public func addToTransactionEntries(_ value: TransactionEntry)
  
  @objc(removeTransactionEntriesObject:)
  @NSManaged public func removeFromTransactionEntries(_ value: TransactionEntry)
  
  @objc(addTransactionEntries:)
  @NSManaged public func addToTransactionEntries(_ values: NSSet)
  
  @objc(removeTransactionEntries:)
  @NSManaged public func removeFromTransactionEntries(_ values: NSSet)
  
}

// MARK: Generated accessors for transactions
extension Icon {
  
  @objc(addTransactionsObject:)
  @NSManaged public func addToTransactions(_ value: Transaction)
  
  @objc(removeTransactionsObject:)
  @NSManaged public func removeFromTransactions(_ value: Transaction)
  
  @objc(addTransactions:)
  @NSManaged public func addToTransactions(_ values: NSSet)
  
  @objc(removeTransactions:)
  @NSManaged public func removeFromTransactions(_ values: NSSet)
  
}
