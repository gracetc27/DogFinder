//
//  DogApiService.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation

class DogApiService: DogService {
    func fetchBreeds() async -> [BreedInfo] {
        var components = URLComponents()
        components.host = "api.thedogapi.com"
        components.scheme = "https"
        components.path = "/v1/breeds"
        components.queryItems = [
            URLQueryItem(name: "limit", value: "10"),
            URLQueryItem(name: "page", value: "0")
        ]

        guard let url = components.url else { return [] }

        var request = URLRequest(url: url)
        request.addValue(apiKey(), forHTTPHeaderField: "x-api-key")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try decoder.decode([BreedInfo].self, from: data)
            return jsonData
        } catch {
            return []
        }
    }
    
    func loadImages(id: Int) async -> [DogImage] {
        var components = URLComponents()
        components.host = "api.thedogapi.com"
        components.scheme = "https"
        components.path = "/v1/images/search"
        components.queryItems = [
            URLQueryItem(name: "include_breeds", value: "false"),
            URLQueryItem(name: "page", value: "0"),
            URLQueryItem(name: "limit", value: "10"),
            URLQueryItem(name: "breed_ids", value: id.formatted())
        ]

        guard let url = components.url else { return [] }

        var request = URLRequest(url: url)
        request.addValue(apiKey(), forHTTPHeaderField: "x-api-key")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try decoder.decode([DogImage].self, from: data)
            return jsonData
        } catch {
            print(error)
            return []
        }
    }
}

private func apiKey() -> String {
    var keys: NSDictionary?

    if let path = Bundle.main.path(forResource: "DogApiKeys", ofType: "plist") {
        keys = NSDictionary(contentsOfFile: path)
    }
    if let dict = keys, let dogKey = dict["DogKey"] as? String {
        return dogKey
    } else {
        return ""
    }
}
