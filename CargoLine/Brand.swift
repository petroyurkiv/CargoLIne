//
//  Brand.swift
//  CargoLine
//
//  Created by Petro on 11.05.2023.
//

import Foundation

enum Brand: CaseIterable {
    case audi
    case bmw
    case mazda
    case mersedesBenz
    case volkswagen
    
    var name: String {
        switch self {
        case .audi:
            return "Audi"
        case .bmw:
            return "BMW"
        case .mazda:
            return "Mazda"
        case .mersedesBenz:
            return "MersedesBenz"
        case .volkswagen:
            return "Volkswagen"
        }
    }
    
    var value: Double {
        switch self {
        case .audi:
            return 1000.0
        case .bmw:
            return 1100.0
        case .mazda:
            return 400.0
        case .mersedesBenz:
            return 800.0
        case .volkswagen:
            return 600.0
        }
    }
}
