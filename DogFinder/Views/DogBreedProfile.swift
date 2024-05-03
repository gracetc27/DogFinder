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
            ScrollView(.horizontal) {
                HStack {
                    ForEach(DummyData.loadImages(id: breedInfo.id)) { image in
                        DogImageView(dogImage: image)
                    }
                }
            }
            .navigationTitle("\(breedInfo.name):")

            VStack {
                    DogInfoBlock(breedInfo: breedInfo)
                }
            }
        }
    }

#Preview {
    NavigationStack {
        DogBreedProfile(breedInfo: DummyData().breedInfoExample[6])
    }
    .environment(DummyData())
}

