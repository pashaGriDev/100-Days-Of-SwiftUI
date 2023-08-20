//
//  ContentView.swift
//  HabitTracker
//
//  Created by Павел Грицков on 20.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activities = Activities()
    
    @State private var showingDetailView = false
    @State private var showingAddActivitiView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink {
                        ActivityDetail(activities: activities, item: activity)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(activity.title)
                                .font(.headline)
                            Text(activity.description)
                        }
                    }
                }
            }
            .navigationTitle("I Habit Tracker")
            .toolbar {
                Button {
                    showingAddActivitiView = true
                } label: {
                        Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivitiView) {
                AddActivityView(activity: activities)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
