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
    let dummyData = DummyData()
    return BreedListView(dogProfile: dummyData.breedInfoExample[0])
}
