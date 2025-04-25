//
//  BreedInfo.swift
//  DogFinder
//
//  Created by Grace couch on 13/05/2024.
//

import Foundation


struct BreedInfo: Equatable, Identifiable {

    let id: Int
    let name: String
    let lifeSpan: String
    let temperament: String?
    let referenceImageId: String
    let image: DogImage
    let height, weight: MeasurementSystem
    let countryCode, description, history: String?
    let bredFor, breedGroup: String?
    var isFavourite: Bool {
        didSet { onIsFavouritedChanged(isFavourite) }
    }
    var onIsFavouritedChanged: (Bool) -> Void

    static func == (lhs: BreedInfo, rhs: BreedInfo) -> Bool {
        lhs.id == rhs.id
    }
}


