//
//  TransactionListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct TransactionListView: View {
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Transaction.entity(),
    sortDescriptors: []
  ) var coreDataTransaction: FetchedResults<Transaction>
  
  var body: some View {
    NavigationView {
      
      List {
        
        Section(header: Text("Hello, World 😎 \(coreDataTransaction.count)")) {
          
          ForEach (coreDataTransaction) { oneTransaction in
            
            HStack {
              
              Text("\(oneTransaction.name ?? "[name]")")
              
              Text("\(oneTransaction.date?.description ?? "[date]")")
              
            }//HStack
            
          }//ForEach
            .onDelete(perform: removeTransaction)
          
        }//Section
        
      }//List
        .navigationBarTitle("Transaction List")
        .navigationBarItems(trailing: EditButton())
      
    }//NavigationView
      .onAppear(perform: appearAction)
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeTransaction(at offsets: IndexSet) {
    for index in offsets {
      let oneTransaction = coreDataTransaction[index]
      moc.delete(oneTransaction)
    }
    if moc.hasChanges {
      print("\(#file): moc has changes")
      do {
        try moc.save()
        print("\(#file): moc saved")
      }
      catch let error {
        print("\(#file): moc cannot save: \(error.localizedDescription)")
      }
    } else {
      print("\(#file): no moc changes")
    }
  }//removeTransaction
  
  /// Aaron KoRn (c) 2020
  func appearAction() {
    print("\(#file): ...")
  }//appearAction
}//TransactionListView

struct TransactionListView_Previews: PreviewProvider {
  static var previews: some View {
    TransactionListView()
  }
}//TransactionListView_Previews
