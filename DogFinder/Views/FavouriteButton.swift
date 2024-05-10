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
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .red : .black)
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
