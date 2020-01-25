//
//  ContentView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//  Tinkering with new core data schema

import SwiftUI

struct ContentView: View {
  
  @Environment(\.managedObjectContext) var moc
  
  @State var selectedView = 0
  
  var body: some View {
    TabView(selection: $selectedView) {
      ListJournalView()
        .tabItem {
          Image(systemName: "1.circle")
          Text("First")
      }.tag(0)
      ListJournalView()
        .tabItem {
          Image(systemName: "2.circle")
          Text("Second")
      }.tag(1)
    }//TabView
      .onAppear(perform: actionContentView)
  }//body
  
  /// Aaron KoRn (c) 2020
  func actionContentView() {
    print("\(#file): ...")
  }//actionContentView
}//ContentView

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}//ContentView_Previews
