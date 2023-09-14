//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Павел Грицков on 14.09.23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
