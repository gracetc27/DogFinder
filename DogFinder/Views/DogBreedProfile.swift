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
                dogImages = await dogViewModel.loadImages(breedInfo.id)
            }
            .padding(.horizontal, 5)
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

