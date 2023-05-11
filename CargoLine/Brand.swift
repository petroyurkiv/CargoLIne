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
    
    var value: Int {
        switch self {
        case .audi:
            return 1000
        case .bmw:
            return 1100
        case .mazda:
            return 400
        case .mersedesBenz:
            return 800
        case .volkswagen:
            return 600
        }
    }
}
