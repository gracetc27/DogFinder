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
        do {
            breeds = try await service.fetchBreeds()
        } catch {
            breeds = []
        }
    }
    
    func loadImages(_ id: Int?) async -> [DogImage] {
        do {
            return try await service.loadImages(id: id)
        } catch {
            return []
        }
    }

    func saveFavouriteBreeds() async throws {
        try await service.saveFavouriteBreeds()
    }

    func loadFavouriteBreeds() async throws {
        try await service.loadFavouriteBreeds()
    }
}
