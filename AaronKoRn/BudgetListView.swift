//
//  BudgetListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct BudgetListView: View {
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Budget.entity(),
    sortDescriptors: []
  ) var coreDataBudget: FetchedResults<Budget>
  
  var body: some View {
    NavigationView {
      
      List {
        
        Section(header: Text("Hello, World 😎 \(coreDataBudget.count)")) {
          
          ForEach (coreDataBudget) { oneBudget in
            
            HStack {
              
              Text("\(oneBudget.name ?? "[name]")")
              
              Text("\(oneBudget.date?.description ?? "[date]")")
              
            }//HStack
            
          }//ForEach
            .onDelete(perform: removeBudget)
          
        }//Section
        
      }//List
        .navigationBarTitle("Budget List")
        .navigationBarItems(trailing: EditButton())
      
    }//NavigationView
      .onAppear(perform: appearAction)
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeBudget(at offsets: IndexSet) {
    for index in offsets {
      let oneBudget = coreDataBudget[index]
      moc.delete(oneBudget)
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
}//BudgetListView

struct BudgetListView_Previews: PreviewProvider {
  static var previews: some View {
    BudgetListView()
  }
}//BudgetListView_Previews
