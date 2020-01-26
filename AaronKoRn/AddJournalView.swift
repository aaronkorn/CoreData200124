//
//  AddJournalView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/25/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct AddJournalView: View {
  
  @Environment(\.managedObjectContext) var moc
  
  @State private var name = ""
  @State private var showingAlert = false
  
  @FetchRequest(
    entity: Icon.entity(),
    sortDescriptors: []
  ) var coreDataIcon: FetchedResults<Icon>
  @State private var selectIcon: Icon = Icon()
  
  var body: some View {
    Form {
      
      Section {
        
        Picker("Select Icon", selection: $selectIcon) {
          ForEach (coreDataIcon) { oneIcon in
            Image(systemName: oneIcon.wrappedIcon).tag(oneIcon)
          }//ForEach
          
        }//Picker
        
      }//Section
      
      Section {
        
        TextField("Journal Name", text: $name)
        
      }//Section
      
      Section {
        
        Button("Create Journal") {
          
          let oneJournal = Journal(context: self.moc)
          oneJournal.id = UUID()
          oneJournal.date = Date()
          oneJournal.name = self.name
          oneJournal.icon = self.selectIcon
          
          print("\(#file): Creating Journal…")
          
          if self.moc.hasChanges {
            print("\(#file): moc has changes")
            do {
              try self.moc.save()
              print("\(#file): moc saved")
              
              self.showingAlert.toggle()
              self.name = ""
              
              //Nice reset but there's a SwiftUI bug
              //self.selectIcon = Icon()
            }
            catch let error {
              print("\(#file): moc cannot save: \(error.localizedDescription)")
            }
          } else {
            print("\(#file): no moc changes")
          }
          
        }//Button
          .alert(isPresented: $showingAlert) {
            Alert(
              title: Text("Important message"),
              message: Text("moc saved"),
              dismissButton: .default(Text("Got it!")))
        }//alert
        
      }//Section
        .disabled(name.isEmpty)
      
    }//Form
      .navigationBarTitle("Add Journal")
      .onAppear(perform: appearAction)
  }//body
  
  /// Aaron KoRn (c) 2020
  func appearAction() {
    print("\(#file): ...")
  }//appearAction
}//AddJournalView

struct AddJournalView_Previews: PreviewProvider {
  static var previews: some View {
    AddJournalView()
  }
}//AddJournalView_Previews
