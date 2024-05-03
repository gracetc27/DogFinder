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
                    HStack(spacing: 0) {
                        ForEach(DummyData.loadImages(id: breedInfo.id)) { image in
                            DogImageView(dogImage: image)
                        }
                    }
                }
                .border(Color.black, width: 5)
                .navigationTitle("\(breedInfo.name):")

                HStack(alignment: .center) {
                    Image(systemName: "pawprint.fill")
                    Image(systemName: "pawprint.fill")
                        .font(.title2)
                    Image(systemName: "pawprint.fill")
                }
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
        DogBreedProfile(breedInfo: DummyData().breedInfoExample[4])
    }
    .environment(DummyData())
}

