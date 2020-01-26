//
//  ContentView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/24/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//  Tinkering with new Core Data and SwiftUI
//
//  1/15/20: Not bad... taking a break

import SwiftUI

struct ContentView: View {
  
  @Environment(\.managedObjectContext) var moc
  
  @State var selectedView = 0
  
  var body: some View {
    TabView(selection: $selectedView) {
      CoreDataEntityListView()
        .tabItem {
          Image(systemName: "1.circle")
          Text("Core Data")
      }.tag(0)
      CategoryListView()
        .tabItem {
          Image(systemName: "2.circle")
          Text("Category")
      }.tag(1)
      BudgetListView()
        .tabItem {
          Image(systemName: "3.circle")
          Text("Budget")
      }.tag(2)
      AccountListView()
        .tabItem {
          Image(systemName: "4.circle")
          Text("Account")
      }.tag(3)
      TransactionListView()
        .tabItem {
          Image(systemName: "5.circle")
          Text("Transaction")
      }.tag(4)
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

// Feature Requests

// Search bar

// History of relatable expenses, maybe a Bill Class
