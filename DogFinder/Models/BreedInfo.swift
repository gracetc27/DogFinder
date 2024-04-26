//
//  BreedInfo.swift
//  DogFinder
//
//  Created by Grace couch on 26/04/2024.
//

import Foundation


struct BreedInfo: Codable, Identifiable {
    let id: Int
    let name: String
    let lifeSpan: String
    let temperament: String
    let referenceImageId: String
    let image: DogImage
    let height, weight: System
    let countryCode, description, history: String?
    let bredFor, breedGroup: String?
}

struct System: Codable {
    let imperial, metric: String
}
