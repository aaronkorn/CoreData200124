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

      }//List

    }//NavigationView

  }//body

}//CoreDataEntityListView

struct CoreDataEntityListView_Previews: PreviewProvider {
  static var previews: some View {
    CoreDataEntityListView()
  }
}//CoreDataEntityListView_Previews
