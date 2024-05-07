//
//  BreedListView.swift
//  DogFinder
//
//  Created by Grace couch on 26/04/2024.
//

import SwiftUI

struct BreedListView: View {
    let dogProfile: BreedInfo
    var body: some View {
        VStack(alignment: .leading) {
            Text(dogProfile.name)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
        }
    }
}
#Preview {
    let breedName = MockDogService.self
    return BreedListView(dogProfile: breedName.breedInfoExample[0])
}
