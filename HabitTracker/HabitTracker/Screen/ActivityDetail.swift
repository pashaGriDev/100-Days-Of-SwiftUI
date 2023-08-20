//
//  ActivityDetail.swift
//  HabitTracker
//
//  Created by Павел Грицков on 20.08.23.
//

import SwiftUI

struct ActivityDetail: View {
    @ObservedObject var activities: Activities
    @State var item: Activity
    
    @State private var count = 0
    
    var body: some View {
        List {
            Section {
                Text(item.title)
                Text(item.description)
                Text("\(item.completionCount)")
            }
            Section {
                Button {
                    item.completionCount += 1
                    update(item)
                } label: {
                    HStack {
                        Spacer()
                        Text("increment")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.blue)
        }
    }
    
    func update(_ item: Activity) {
        if let index = activities.items.firstIndex(where: { $0.id == item.id }) {
            activities.items[index] = item
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activities: Activities(),
                       item: Activity(title: "Title",
                                      description: "Desc"))
    }
}
