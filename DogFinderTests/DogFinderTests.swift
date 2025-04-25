//
//  DogFinderTests.swift
//  DogFinderTests
//
//  Created by Grace couch on 24/04/2024.
//

import Testing
@testable import DogFinder
import Foundation

@Test func breedsUpdatedFromFetchBreedsSuccess() async {
    let sut = DogViewModel(service: FakeDogServiceSuccess())
    #expect(sut.breeds == [])

    await sut.fetchBreeds()

    #expect(sut.breeds[0].name == "Staffy")
    #expect(sut.breeds[0].id == 0)
    #expect(sut.breeds[0].bredFor == "fighting")
}

@Test func breedsUpdatedFromFetchBreedsFailure() async {
    let sut = DogViewModel(service: FakeDogServiceFailure())
    #expect(sut.breeds == [])
    
    await sut.fetchBreeds()
    
    #expect(sut.breeds == [])
}

@Test func fetchImagesResponse() async {
    let sut = DogViewModel(service: FakeDogServiceSuccess())
    let id = 3

    let sutResult = await sut.loadImages(id)
    let serviceResult = [
        DogImage(id: "1", url: URL(string: "google.com")!)
    ]

    #expect(sutResult == serviceResult)

}
class FakeDogServiceSuccess: DogService {
    func fetchBreeds() async throws -> [BreedInfo] {
        [
            BreedInfo(id: 0, name: "Staffy", lifeSpan: "13", temperament: "Dopey", referenceImageId: "0", image: DogImage(id: "0", url: URL(string: "google.com")!), height: MeasurementSystem(imperial: "10", metric: "10"), weight: MeasurementSystem(imperial: "10", metric: "10"), countryCode: "UK", description: "Lovely dog", history: "sad history of fighting", bredFor: "fighting", breedGroup: "Terrier", isFavourite: true, onIsFavouritedChanged: { _ in })
        ]
    }
    
    func loadImages(id: Int?) async throws -> [DogImage] {
        [
            DogImage(id: "1", url: URL(string: "google.com")!)
        ]
    }
    
    func saveFavouriteBreeds() async throws {}
    
    func loadFavouriteBreeds() async throws {}

}

class FakeDogServiceFailure: DogService {
    func fetchBreeds() async throws -> [BreedInfo] {
        throw CancellationError()
    }
    
    func loadImages(id: Int?) async throws -> [DogImage] {
        throw CancellationError()
    }
    
    func saveFavouriteBreeds() async throws {}
    
    func loadFavouriteBreeds() async throws {}

}
