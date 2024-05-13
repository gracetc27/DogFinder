//
//  MockDogService.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation

class MockDogService: DogService {

    var favouriteBreeds: Set<Int> = []
    func loadImages(id: Int?) async -> [DogImage] {
        loadJson(fileName: "BreedImages-\(id ?? 3).json", asType: [DogImage].self)
    }
    
    func fetchBreeds() async -> [BreedInfo] {
        return loadJson(fileName: "breeds.json", asType: [DogApiBreedInfo].self)
            .map { dogApiBreedInfo in
            BreedInfo(
                id: dogApiBreedInfo.id,
                name: dogApiBreedInfo.name,
                lifeSpan: dogApiBreedInfo.lifeSpan,
                temperament: dogApiBreedInfo.temperament,
                referenceImageId: dogApiBreedInfo.referenceImageId,
                image: dogApiBreedInfo.image,
                height: dogApiBreedInfo.height,
                weight: dogApiBreedInfo.weight,
                countryCode: dogApiBreedInfo.countryCode,
                description: dogApiBreedInfo.description,
                history: dogApiBreedInfo.history,
                bredFor: dogApiBreedInfo.bredFor,
                breedGroup: dogApiBreedInfo.breedGroup,
                isFavourite: true,
                onIsFavouritedChanged: { [weak self] isFavourited in
                    if isFavourited {
                        self?.favouriteBreeds.insert(dogApiBreedInfo.id)
                    } else {
                        self?.favouriteBreeds.remove(dogApiBreedInfo.id)
                    }
                }
            )
        }
    }
}


extension MockDogService {
    static var breedInfoExample: [BreedInfo] {
        let response = loadJson(fileName: "breeds.json", asType: [DogApiBreedInfo].self)
        return response.map { dogApiBreedInfo in BreedInfo(
            id: dogApiBreedInfo.id,
            name: dogApiBreedInfo.name,
            lifeSpan: dogApiBreedInfo.lifeSpan,
            temperament: dogApiBreedInfo.temperament,
            referenceImageId: dogApiBreedInfo.referenceImageId,
            image: dogApiBreedInfo.image,
            height: dogApiBreedInfo.height,
            weight: dogApiBreedInfo.weight,
            countryCode: dogApiBreedInfo.countryCode,
            description: dogApiBreedInfo.description,
            history: dogApiBreedInfo.history,
            bredFor: dogApiBreedInfo.bredFor,
            breedGroup: dogApiBreedInfo.breedGroup,
            isFavourite: true,
            onIsFavouritedChanged: { _ in }
        )
    }
}
            static var dogExample: [DogImage] = loadJson(fileName: "BreedImages-5.json", asType: [DogImage].self)
        }

        func loadJson<Model: Decodable>(fileName: String, asType: Model.Type) -> Model {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)
            else {
                fatalError("Couldn't load \(fileName)")
            }
            do {
                let data = try Data(contentsOf: url)
                return try data.decode(as: Model.self)
            } catch {
                fatalError("An error has occurred")
            }
        }
