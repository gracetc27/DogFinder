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
                .navigationTitle("\(breedInfo.name):")
                

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
    }
}


#Preview {
    NavigationStack {
        DogBreedProfile(breedInfo: MockDogService.breedInfoExample[6])
    }
    .environment(\.dogService, MockDogService())
}

