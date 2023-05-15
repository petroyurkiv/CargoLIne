//
//  Fuel.swift
//  CargoLine
//
//  Created by Petro on 11.05.2023.
//

import Foundation

enum Fuel: CaseIterable {
    case petrol
    case diesel
    case gas
    case electro
    
    var name: String {
        switch self {
        case .petrol:
            return "Petrol"
        case .diesel:
            return "Diesel"
        case .gas:
            return "Gas"
        case .electro:
            return "Electro"
        }
    }
    
    var value: Double {
        switch self {
        case .petrol:
            return 200.0
        case .diesel:
            return 300.0
        case .gas:
            return 150.0
        case .electro:
            return 500.0
        }
    }
}
