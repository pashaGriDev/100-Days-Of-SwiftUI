//
//  String + ext.swift
//  CupcakeCorner
//
//  Created by Павел Грицков on 19.08.23.
//

import Foundation

extension String {
    
    var isOnlyWithespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
