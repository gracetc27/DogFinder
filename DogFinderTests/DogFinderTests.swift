//
//  DogFinderTests.swift
//  DogFinderTests
//
//  Created by Grace couch on 24/04/2024.
//

import Testing
@testable import DogFinder
import Foundation

@Test func successBreedsAssignedFromFetchBreeds() async {
    let sut = DogViewModel(service: FakeDogService())
    #expect(sut.breeds == [])

    await sut.fetchBreeds()

    #expect(sut.breeds[0].name == "Staffy")
    #expect(sut.breeds[0].id == 0)
    #expect(sut.breeds[0].bredFor == "fighting")
}

class FakeDogService: DogService {
    func fetchBreeds() async -> [DogFinder.BreedInfo] {
        let breeds = [
            BreedInfo(id: 0, name: "Staffy", lifeSpan: "13", temperament: "Dopey", referenceImageId: "0", image: DogImage(id: "0", url: URL(string: "google.com")!), height: MeasurementSystem(imperial: "10", metric: "10"), weight: MeasurementSystem(imperial: "10", metric: "10"), countryCode: "UK", description: "Lovely dog", history: "sad history of fighting", bredFor: "fighting", breedGroup: "Terrier", isFavourite: true, onIsFavouritedChanged: { _ in })
        ]
        return breeds
    }
    
    func loadImages(id: Int?) async -> [DogFinder.DogImage] {
        let dogImages = [
            DogImage(id: "1", url: URL(string: "google.com")!)
        ]
        return dogImages
    }
    
    func saveFavouriteBreeds() async throws {}
    
    func loadFavouriteBreeds() async throws {}

}
