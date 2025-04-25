//
//  MeasurementSystem.swift
//  DogFinder
//
//  Created by Grace couch on 13/05/2024.
//

import Foundation

struct MeasurementSystem: Codable, Equatable {
    let imperial, metric: String
}

extension MeasurementSystem {
    func forLocale(_ locale: Locale) -> String {
        switch locale.measurementSystem {
        case .metric:
            metric
        default:
            imperial
        }
    }
}

