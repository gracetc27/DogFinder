//
//  DogBreedProfile.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogBreedProfile: View {
    @Environment(DogViewModel.self) var dogViewModel
    @State var dogImages: [DogImage] = []
    @Binding var breedInfo: BreedInfo

    var body: some View {
        ScrollView {
            VStack(spacing: 3) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(dogImages) { image in
                            DogImageView(dogImage: image)
                        }
                        .containerRelativeFrame(.horizontal)
                        .frame(height: 350)
                        .clipped()
                    }
                }
                
                PawSeparator()

                DogInfoBlock(breedInfo: breedInfo)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .task {
                dogImages = await dogViewModel.loadImages(breedInfo.id)
            }
        }
        
        .navigationTitle("\(breedInfo.name):")
        .toolbar {
            FavouriteButton(isSet: $breedInfo.isFavourite)
                .buttonStyle(.plain)
        }
    }
}


#Preview {
    NavigationStack {
        DogBreedProfile(breedInfo: .constant(MockDogService.breedInfoExample[6]))
    }
    .environment(DogViewModel(service: MockDogService()))
}

