//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Павел Грицков on 14.09.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var wizard: FetchedResults<Wizard>
    
    var body: some View {
        Text("Hey")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
