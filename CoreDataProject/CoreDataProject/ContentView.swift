//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Павел Грицков on 14.09.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizard: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizard, id: \.self) {wizard in
                Text(wizard.name ?? "Unknow")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
