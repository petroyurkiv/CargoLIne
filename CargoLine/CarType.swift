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
    
    var value: Int {
        switch self {
        case .sedan:
            return 50
        case .coupe:
            return 200
        case .wagon:
            return 300
        case .minivan:
            return 80
        }
    }
}
