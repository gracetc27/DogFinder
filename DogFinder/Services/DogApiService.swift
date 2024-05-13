//
//  DogApiService.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation

class DogApiService: DogService {
    func saveFavouriteBreed(id: Int, favourited: Bool) {
        #warning("needs implementing")
    }
    
    func getFavourites() -> [Int] {
        #warning("needs implementing")
        return []
    }
    

    enum APIError: Error {
        case invalidURL
    }

    private let apiKey = getApiKey()

    func fetchBreeds() async -> [BreedInfo] {
        do {
            let response = try await loadData(
                path:"/v1/breeds",
                queryItems: [ 
                    URLQueryItem(name: "limit", value: "10"),
                    URLQueryItem(name: "page", value: "0")
                ],
                as: [DogApiBreedInfo].self)

            return response.map { dogApiBreedInfo in
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
                        self?.saveFavouriteBreed(id: dogApiBreedInfo.id, favourited: isFavourited)
                    }
                )
            }
        } catch {
            return []
        }
    }

    
    func loadImages(id: Int? = nil) async -> [DogImage] {
        var queryItems = [
            URLQueryItem(name: "include_breeds", value: "false"),
            URLQueryItem(name: "page", value: "0"),
            URLQueryItem(name: "limit", value: "10")
        ]
        if let id {
            let breedIdQuery = URLQueryItem(name: "breed_ids", value: id.formatted())
            queryItems.append(breedIdQuery)
        }

        do {
            return try await loadData(
                path: "/v1/images/search",
                queryItems: queryItems,
                as: [DogImage].self
            )
        } catch {
            return []
        }
    }

    private func loadData<DataModel: Decodable>(path: String, queryItems: [URLQueryItem], as type: DataModel.Type) async throws -> DataModel {
        var components = URLComponents()
        components.host = "api.thedogapi.com"
        components.scheme = "https"
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else { throw APIError.invalidURL }

        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        let (data, _) = try await URLSession.shared.data(for: request)
        return try data.decode(as: DataModel.self)
    }
}

private func getApiKey() -> String {
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
