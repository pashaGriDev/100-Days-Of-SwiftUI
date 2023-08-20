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
            Text(item.title)
            Text(item.description)
            Stepper("count \(item.completionCount)", value: $item.completionCount, step: 1)
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
