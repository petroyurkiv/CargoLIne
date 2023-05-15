//
//  Country.swift
//  CargoLine
//
//  Created by Petro on 11.05.2023.
//

import Foundation

enum Country: Int {
    case ukraine
    case usa
    
    var name: String {
        switch self {
        case .ukraine:
            return "Ukraine"
        case .usa:
            return "USA"
        }
    }
    
    var value: Double {
        switch self {
        case .ukraine:
            return 1.0
        case .usa:
            return 1.2
        }
    }
}
