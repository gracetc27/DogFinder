//
//  DogService.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import Foundation
import SwiftUI

protocol DogService {
    func fetchBreeds() async throws -> [BreedInfo]
    func loadImages(id: Int?) async throws -> [DogImage]
    func saveFavouriteBreeds() async throws
    func loadFavouriteBreeds() async throws
}

