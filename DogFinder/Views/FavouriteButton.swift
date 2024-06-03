//
//  FavouriteButton.swift
//  DogFinder
//
//  Created by Grace couch on 10/05/2024.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
            .labelStyle(.iconOnly)
            .foregroundStyle(isSet ? .red : .black)
            .accessibilityAddTraits(.isButton)
            .onTapGesture {
                isSet.toggle()
            }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
