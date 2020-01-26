//
//  AccountListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct AccountListView: View {
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Account.entity(),
    sortDescriptors: []
  ) var coreDataAccount: FetchedResults<Account>
  
  var body: some View {
    NavigationView {
      
      List {
        
        Section(header: Text("Hello, World 😎")) {
          
          NavigationLink(destination: AddAccountView()) {
            
            Image(systemName: "plus.circle.fill")
            Text("Add Account")
            
          }//NavigationLink
          
        }//Section
        
        Section(header: Text("How many? \(coreDataAccount.count)")) {
          
          ForEach (coreDataAccount) { oneAccount in
            
            HStack {
              
              Text("\(oneAccount.name ?? "[name]")")
              
              Text("\(oneAccount.date?.description ?? "[date]")")
              
            }//HStack
            
          }//ForEach
            .onDelete(perform: removeAccount)
          
        }//Section
        
      }//List
        .navigationBarTitle("Account List")
        .navigationBarItems(trailing: EditButton())
      
    }//NavigationView
      .onAppear(perform: appearAction)
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeAccount(at offsets: IndexSet) {
    for index in offsets {
      let oneAccount = coreDataAccount[index]
      moc.delete(oneAccount)
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
}//AccountListView

struct AccountListView_Previews: PreviewProvider {
  static var previews: some View {
    AccountListView()
  }
}//AccountListView_Previews
