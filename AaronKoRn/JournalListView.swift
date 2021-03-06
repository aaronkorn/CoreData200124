//
//  JournalListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct JournalListView: View {
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Journal.entity(),
    sortDescriptors: []
  ) var coreDataJournal: FetchedResults<Journal>
  
  var body: some View {
    
    List {
      
      Section(header: Text("Hello, World 😎")) {
        
        NavigationLink(destination: AddJournalView()) {
          
          Image(systemName: "plus.circle.fill")
          Text("Add Journal")
          
        }//NavigationLink
        
      }//Section
      
      Section(header: Text("How many? \(coreDataJournal.count)")) {
        
        ForEach (coreDataJournal) { oneJournal in
          
          HStack {
            
            Image(systemName: "\(oneJournal.wrappedIcon)")
              .font(.title)

            Text("\(oneJournal.name ?? "[name]")")
            
            Spacer()
            
            Text("\(oneJournal.wrappedDate)")
            
          }//HStack
          
        }//ForEach
          .onDelete(perform: removeJournal)
        
      }//Section
      
    }//List
      .navigationBarTitle("Journal List")
      .navigationBarItems(trailing: EditButton())
      .onAppear(perform: appearAction)
    
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeJournal(at offsets: IndexSet) {
    for index in offsets {
      let oneJournal = coreDataJournal[index]
      moc.delete(oneJournal)
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
}//JournalListView

struct JournalListView_Previews: PreviewProvider {
  static var previews: some View {
    JournalListView()
  }
}//JournalListView_Previews
