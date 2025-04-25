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
    var dogOfTheDay: BreedInfo? {
        guard !breeds.isEmpty else { return nil }
        let dayOfYear = Calendar.autoupdatingCurrent.ordinality(of:
                .day, in: .year, for: .now)!
        let breedCount = breeds
            .count
        let index = ((dayOfYear - 1) % breedCount)
        let breed = breeds[index]
        return breed
    }

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
