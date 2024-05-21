//
//  DogViewModel.swift
//  DogFinder
//
//  Created by Grace couch on 13/05/2024.
//

import Foundation

@Observable
class DogViewModel {
    var service: DogService
    var breeds: [BreedInfo] = []

    init(service: DogService) {
        self.service = service
    }

    func fetchBreeds() async {
        breeds = await service.fetchBreeds()
    }
    func loadImages(_ id: Int?) async -> [DogImage] {
        return await service.loadImages(id: id)
    }

    func saveFavouriteBreeds() async throws {
        try await service.saveFavouriteBreeds()
    }

    func loadFavouriteBreeds() async throws {
        try await service.loadFavouriteBreeds()
    }
}
