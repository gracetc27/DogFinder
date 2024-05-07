//
//  DogBreedProfile.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogBreedProfile: View {
    @Environment(DummyData.self) var dummyData
    var breedInfo: BreedInfo
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(DummyData.loadImages(id: breedInfo.id)) { image in
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
            .padding(.horizontal, 5)
        }
    }
}


#Preview {
    NavigationStack {
        DogBreedProfile(breedInfo: DummyData().breedInfoExample[6])
    }
    .environment(DummyData())
}

