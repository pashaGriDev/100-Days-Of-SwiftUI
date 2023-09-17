//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Павел Грицков on 14.09.23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [],
                  predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknow name")
            }
            
            Button("Add examples") {
                let ship = Ship(context: moc)
                ship.name = "Enterprise"
                ship.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millenium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executer"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
