//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Павел Грицков on 14.08.23.
//

import Foundation
import SwiftUI

struct ExpenseRow: View {
    
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            Text(item.name)
                .font(.headline)
            Spacer()
            Text(item.amount,
                 format:
                    .currency(code: Locale.current.currency?.identifier ?? "USD"))
            
        }
    }
}
