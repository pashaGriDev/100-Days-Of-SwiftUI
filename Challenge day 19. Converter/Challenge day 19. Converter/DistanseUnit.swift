//
//  DistanseUnit.swift
//  Challenge day 19. Converter
//
//  Created by Павел Грицков on 19.07.23.
//

import Foundation

enum DistanceUnit: String, CaseIterable, Identifiable {
    
    case miles, kilometers, meters, feet, yards
    
    var id: Self { self }
    
    var convertToUnitLength: UnitLength {
            switch self {
            case .miles:
                return .miles
            case .kilometers:
                return .kilometers
            case .meters:
                return .meters
            case .feet:
                return .feet
            case .yards:
                return .yards
            }
        }
}
