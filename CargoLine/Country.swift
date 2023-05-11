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
    
    var value: Double {
        switch self {
        case .ukraine:
            return 1.0
        case .usa:
            return 1.2
        }
    }
}
