//
//  DogBreedProfile.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogBreedProfile: View {
    var breedInfo: BreedInfo
    var body: some View {

        ScrollView(.horizontal) {
            HStack {
                ForEach(DummyData.loadImages(id: breedInfo.id)) { image in
                    DogImageView(dogImage: image)
                }
            }


        }
        .navigationTitle("\(breedInfo.name):")
    }
}
#Preview {
    NavigationStack {
        DogBreedProfile(breedInfo: DummyData().breedInfoExample[0])
    }
}

