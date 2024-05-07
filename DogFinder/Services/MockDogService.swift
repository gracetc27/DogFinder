//
//  MockDogService.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation

class MockDogService: DogService {
    func loadImages(id: Int) async -> [DogImage] {
        loadJson(fileName: "BreedImages-\(id).json", asType: [DogImage].self)
    }
    
    func fetchBreeds() async -> [BreedInfo] {
        loadJson(fileName: "breeds.json", asType: [BreedInfo].self)
    }
}


extension MockDogService {
    static var breedInfoExample: [BreedInfo] = loadJson(fileName: "breeds.json", asType: [BreedInfo].self)
    static var dogExample: [DogImage] = loadJson(fileName: "BreedImages-5.json", asType: [DogImage].self)
}

func loadJson<Model: Decodable>(fileName: String, asType: Model.Type) -> Model {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't load \(fileName)")
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = try decoder.decode(Model.self, from: data)
        return jsonData
    } catch {
        fatalError("An error has occurred")
    }
}
