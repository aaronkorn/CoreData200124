//
//  AddAccountView.swift
//  CoreData200124
//
//  Created by AARON KORN on 1/25/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//

import SwiftUI

struct AddAccountView: View {
  
  @Environment(\.managedObjectContext) var moc
  
  @FetchRequest(
    entity: Icon.entity(),
    sortDescriptors: []
  ) var coreDataIcon: FetchedResults<Icon>
  @State private var selectIcon: Icon = Icon()
  
  @State private var name = ""
  @State private var showingAlert = false
  
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
        
        TextField("Account Name", text: $name)
        
      }//Section
      
      Section {
        
        Button("Create Account") {
          
          let oneAccount = Account(context: self.moc)
          oneAccount.id = UUID()
          oneAccount.date = Date()
          oneAccount.name = self.name
          oneAccount.icon = self.selectIcon
          
          print("\(#file): Creating Account…")
          
          if self.moc.hasChanges {
            print("\(#file): moc has changes")
            do {
              try self.moc.save()
              print("\(#file): moc saved")
              
              self.showingAlert.toggle()
              self.name = ""
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
      .navigationBarTitle("Add Account")
      .onAppear(perform: appearAction)
    
  }//body
  
  /// Aaron KoRn (c) 2020
  func appearAction() {
    print("\(#file): ...")
  }//appearAction
}//AddAccountView

struct AddAccountView_Previews: PreviewProvider {
  static var previews: some View {
    AddAccountView()
  }
}//AddAccountView_Previews
