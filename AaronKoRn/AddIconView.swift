//
//  AddIconView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/25/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct AddIconView: View {
  
  @Environment(\.managedObjectContext) var moc
  
  @State private var name = ""
  
  var body: some View {
    
    Form {
      
      Section {
        
        TextField("Icon Name", text: $name)
        
      }//Section
      
      Section {
        
        Button("Create Icon") {
          
          let oneIcon = Icon(context: self.moc)
          oneIcon.id = UUID()
          oneIcon.date = Date()
          oneIcon.name = self.name
          
          print("\(#file): Creating Icon…")
          
          if self.moc.hasChanges {
            print("\(#file): moc has changes")
            do {
              try self.moc.save()
              print("\(#file): moc saved")
            }
            catch let error {
              print("\(#file): moc cannot save: \(error.localizedDescription)")
            }
          } else {
            print("\(#file): no moc changes")
          }

        }//Button
        
      }//Section
      .disabled(name.isEmpty)
      
    }//Form
      .navigationBarTitle("Add Icon")
      .onAppear(perform: appearAction)
    
  }//body
  
  /// Aaron KoRn (c) 2020
  func appearAction() {
    print("\(#file): ...")
  }//appearAction
}//AddIconView

struct AddIconView_Previews: PreviewProvider {
  static var previews: some View {
    AddIconView()
  }
}//AddIconView_Previews
