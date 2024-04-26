//
//  DummyImageData.swift
//  DogFinder
//
//  Created by Grace couch on 25/04/2024.
//

import Foundation

@Observable
class DummyData {
    var dogExample: [DogImage] = loadJson(fileName: "dogimagesResponse.json", asType: [DogImage].self)
}


func loadJson<Model: Decodable>(fileName: String, asType: Model.Type) -> Model {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't load \(fileName)")
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(Model.self, from: data)
        return jsonData
    } catch {
        fatalError("An error has occurred")
    }
}

