//
//  DogService.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation
import SwiftUI

protocol DogService {
    func fetchBreeds() async -> [BreedInfo]
    func loadImages(id: Int?) async -> [DogImage]
}

enum DogServiceEnvironmentKey: EnvironmentKey {
    static var defaultValue: any DogService = MockDogService()
}

extension EnvironmentValues {
    var dogService: any DogService {
        get { self[DogServiceEnvironmentKey.self] }
        set { self[DogServiceEnvironmentKey.self] = newValue }
    }
}
