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
        if lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.lifeSpan == rhs.lifeSpan &&
            lhs.temperament == rhs.temperament &&
            lhs.referenceImageId == rhs.referenceImageId &&
            lhs.image == rhs.image &&
            lhs.height == rhs.height &&
            lhs.weight == rhs.weight &&
            lhs.countryCode == rhs.countryCode &&
            lhs.description == rhs.description &&
            lhs.history == rhs.history &&
            lhs.bredFor == rhs.bredFor &&
            lhs.breedGroup == rhs.breedGroup &&
            lhs.isFavourite == rhs.isFavourite {
                return true
        } else {
            return false
        }
    }
}



