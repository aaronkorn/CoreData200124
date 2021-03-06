//
//  SubCategoryListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.

import SwiftUI

struct SubCategoryListView: View {
  @Environment(\.managedObjectContext) var moc
  
  let parentCategory : Category
  
  var body: some View {
    
    List {
      
      Section(header: Text("Hello, World 😎 \(parentCategory.childrenArray.count)")) {
        
        ForEach (parentCategory.childrenArray) { oneCategory in
          
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
      .navigationBarTitle("Sub Category List")
      .navigationBarItems(trailing: EditButton())
      .onAppear(perform: appearAction)
    
  }//body
  
  /// Aaron KoRn (c) 2020
  func removeCategory(at offsets: IndexSet) {
    for index in offsets {
      let oneCategory = parentCategory.childrenArray[index]
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
}//SubCategoryListView

struct SubCategoryListView_Previews: PreviewProvider {
  static var oneCategory: Category {
    let oneCategory = Category()
    oneCategory.id = UUID()
    oneCategory.name = "Unknown Name"
    return oneCategory
  }
  static var previews: some View {
    SubCategoryListView(parentCategory: oneCategory)
  }
}//SubCategoryListView_Previews
