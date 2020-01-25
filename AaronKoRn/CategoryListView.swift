//
//  CategoryListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct CategoryListView: View {
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Category.entity(),
    sortDescriptors: []
  ) var coreDataCategory: FetchedResults<Category>
  
  var body: some View {
    NavigationView {
      
      List {
        
        Section(header: Text("Hello, World 😎 \(coreDataCategory.count)")) {
          
          ForEach (coreDataCategory, id: \.id) { oneCategory in
            
            NavigationLink(destination: SubCategoryListView(parentCategory: oneCategory)) {
              HStack {
                
                Text("\(oneCategory.name ?? "[name]")")
                
                Text("\(oneCategory.date?.description ?? "[date]")")
                
              }//HStack
            }//NavigationLink
            
          }//ForEach
            .onDelete(perform: removeCategory)
          
        }//Section
        
      }//List
        .navigationBarTitle("Category List")
        .navigationBarItems(trailing: EditButton())
      
    }//NavigationView
      .onAppear(perform: appearAction)
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeCategory(at offsets: IndexSet) {
    for index in offsets {
      let oneCategory = coreDataCategory[index]
      moc.delete(oneCategory)
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
}//CategoryListView

struct CategoryListView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryListView()
  }
}//CategoryListView_Previews
