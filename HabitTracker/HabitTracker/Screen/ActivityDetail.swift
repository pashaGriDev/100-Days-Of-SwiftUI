//
//  ActivityDetail.swift
//  HabitTracker
//
//  Created by Павел Грицков on 20.08.23.
//

import SwiftUI

struct ActivityDetail: View {
    @ObservedObject var activities: Activities
    var item: Activity
    
    var body: some View {
        List {
            Text(item.title)
            Text(item.description)
            Text("\(item.completionCount)")
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
