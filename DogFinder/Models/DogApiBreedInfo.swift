//
//  DogApiBreedInfo.swift
//  DogFinder
//
//  Created by Grace couch on 26/04/2024.
//

import Foundation


struct DogApiBreedInfo: Codable, Identifiable {
    let id: Int
    let name: String
    let lifeSpan: String
    let temperament: String
    let referenceImageId: String
    let image: DogImage
    let height, weight: MeasurementSystem
    let countryCode, description, history: String?
    let bredFor, breedGroup: String?
}
