//
//  DogInfoBlock.swift
//  DogFinder
//
//  Created by Grace couch on 03/05/2024.
//

import SwiftUI

struct DogInfoBlock: View {
    @Environment(\.locale) var locale
    let breedInfo: BreedInfo
    var body: some View {
        VStack(alignment: .leading) {
            InfoStyle(headline: "Life Span:", info: "\(breedInfo.lifeSpan)")
            InfoStyle(headline: "Height:", info: "\(breedInfo.height.forLocale(locale))")
            InfoStyle(headline: "Weight:", info: "\(breedInfo.weight.forLocale(locale))")
            InfoStyle(headline: "Temperament:", info: "\(breedInfo.temperament)")
            if let bredFor = breedInfo.bredFor {
                InfoStyle(headline: "Bred for:", info: "\(bredFor)")
            }
            if let breedGroup = breedInfo.breedGroup {
                InfoStyle(headline: "Breed Group:", info: "\(breedGroup)")
            }
            if let history = breedInfo.history, !history.isEmpty {
                InfoStyle(headline: "History:", info: "\(history)")
            }
            if let description = breedInfo.description {
                InfoStyle(headline: "Description:", info: "\(description)")
            }
        }
        .padding()
    }
}

struct InfoStyle: View {
    let headline: String
    let info: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(headline)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Text(info)
                .font(.callout)
        }
    }
}


#Preview {
    let mockDogData = MockDogService.self
    return DogInfoBlock(breedInfo: mockDogData.breedInfoExample[6])
        .environment(\.locale, Locale(identifier: "en-GB"))
}

#Preview {
    let mockDogData = MockDogService.self
    return DogInfoBlock(breedInfo: mockDogData.breedInfoExample[6])
        .environment(\.locale, Locale(identifier: "en-VI"))
}
