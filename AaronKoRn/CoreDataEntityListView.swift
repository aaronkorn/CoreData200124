//
//  CoreDataEntityListView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/25/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct CoreDataEntityListView: View {
  
  var body: some View {
    
    NavigationView {
      
      List {
        
        NavigationLink(destination: JournalListView()) {
          
          Image(systemName: "1.circle")
          Text("Journal")
          
        }//NavigationLink
        
        NavigationLink(destination: IconListView()) {
          
          Image(systemName: "2.circle")
          Text("Icon")
          
        }//NavigationLink

      }//List
        .navigationBarTitle("Core Data Entity")
      
    }//NavigationView
      .onAppear(perform: appearAction)
  }//body
  
  /// Aaron KoRn (c) 2020
  func appearAction() {
    print("\(#file): ...")
  }//appearAction
}//CoreDataEntityListView

struct CoreDataEntityListView_Previews: PreviewProvider {
  static var previews: some View {
    CoreDataEntityListView()
  }
}//CoreDataEntityListView_Previews
