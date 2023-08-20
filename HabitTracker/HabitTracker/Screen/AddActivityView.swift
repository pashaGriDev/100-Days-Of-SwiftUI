//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Павел Грицков on 20.08.23.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var activity: Activities
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("title", text: $title)
                TextField("description", text: $description)
            } header: {
                Text("Can add new item here")
            }
            Section {
                Button {
                    let newItem = Activity(title: title, description: description)
                    activity.items.append(newItem)
                    dismiss()
                } label: {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Seve item")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.blue)
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activity: Activities())
    }
}
