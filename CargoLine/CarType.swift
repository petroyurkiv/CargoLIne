//
//  CarType.swift
//  CargoLine
//
//  Created by Petro on 11.05.2023.
//

import Foundation

enum CarType: CaseIterable {
    case sedan
    case coupe
    case wagon
    case minivan
    
    var name: String {
        switch self {
        case .sedan:
            return R.string.texts.cargoLineCarTypeSedan()
        case .coupe:
            return R.string.texts.cargoLineCarTypeCoupe()
        case .wagon:
            return R.string.texts.cargoLineCarTypeWagon()
        case .minivan:
            return R.string.texts.cargoLineCarTypeMinivan()
        }
    }
    
    var value: Double {
        switch self {
        case .sedan:
            return 50.0
        case .coupe:
            return 200.0
        case .wagon:
            return 300.0
        case .minivan:
            return 80.0
        }
    }
}
