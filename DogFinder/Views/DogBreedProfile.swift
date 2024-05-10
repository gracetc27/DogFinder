//
//  DogBreedProfile.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogBreedProfile: View {
    @Environment(\.dogService) var dogService
    @State var dogImages: [DogImage] = []
    var breedInfo: BreedInfo
    @State private var isFavourited = false

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
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
                .border(Color.black, width: 5)

                PawSeparator()

                DogInfoBlock(breedInfo: breedInfo)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .border(Color.black, width: 5)
            }
            .task {
                dogImages = await dogService.loadImages(id: breedInfo.id)
            }
            .padding(.horizontal, 5)
        }
        .onChange(of: isFavourited) { _, newValue in
            dogService.saveFavouriteBreed(id: breedInfo.id, favourited: newValue)
        }
        .onAppear {
            let favourites = dogService.getFavourites()
            let isFavourited = favourites.contains { savedId in
                savedId == breedInfo.id
            }
            self.isFavourited = isFavourited
        }
        .navigationTitle("\(breedInfo.name):")
        .toolbar(content: {
            FavouriteButton(isSet: $isFavourited)
                .buttonStyle(.plain)
        })
    }
}


#Preview {
    NavigationStack {
        DogBreedProfile(breedInfo: MockDogService.breedInfoExample[6])
    }
    .environment(\.dogService, MockDogService())
}

