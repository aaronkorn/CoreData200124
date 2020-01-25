//
//  IconListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/25/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct IconListView: View {
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Icon.entity(),
    sortDescriptors: []
  ) var coreDataIcon: FetchedResults<Icon>
  
  var body: some View {
    
    List {
      
      Section(header: Text("Hello, World 😎")) {
        
        NavigationLink(destination: Text("AddIconView")) {
          
          Image(systemName: "plus.circle.fill")
          Text("Add Icon")
          
        }//NavigationLink

      }//Section
      
      Section(header: Text("How many? \(coreDataIcon.count)")) {
        
        ForEach (coreDataIcon, id: \.id) { oneIcon in
          
          HStack {
            
            Text("\(oneIcon.name ?? "[name]")")
            
            Text("\(oneIcon.date?.description ?? "[date]")")
            
          }//HStack
          
        }//ForEach
          .onDelete(perform: removeIcon)
        
      }//Section
      
    }//List
      .navigationBarTitle("Icon List")
      .navigationBarItems(trailing: EditButton())
      .onAppear(perform: appearAction)
    
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeIcon(at offsets: IndexSet) {
    for index in offsets {
      let oneIcon = coreDataIcon[index]
      moc.delete(oneIcon)
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
}//IconListView

struct IconListView_Previews: PreviewProvider {
  static var previews: some View {
    IconListView()
  }
}//IconListView_Previews
