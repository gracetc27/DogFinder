//
//  DogOfTheDayImage.swift
//  DogFinder
//
//  Created by Grace couch on 05/06/2024.
//

import SwiftUI

struct DogOfTheDayImage: View {
    @Environment(DogViewModel.self) var dogViewModel

    var body: some View {
        if let breed = dogViewModel.dogOfTheDay {
            DogImageView(dogImage: breed.image)
                .overlay(alignment: .bottomTrailing) {
                    Text(breed.name)
                        .font(.title2.bold())
                        .background(.ultraThinMaterial, in: .rect(cornerRadius: 7))
                }
        } else {
            ProgressView()
                .task { await dogViewModel.fetchBreeds() }
        }
    }
}
#Preview {
    let viewModel = DogViewModel(service: MockDogService())
    return DogOfTheDayImage()
        .environment(viewModel)
}

