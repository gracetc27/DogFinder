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

