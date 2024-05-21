//
//  HomeScreen.swift
//  DogFinder
//
//  Created by Grace couch on 08/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(DogViewModel.self) var dogViewModel
    var body: some View {
        VStack {
            Label("Dog Of The Day", systemImage: "pawprint.fill")
                .font(.headline)
                .padding(5)
            Rectangle().frame(minWidth: 350, minHeight: 300)

            HStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                Text("Breed Favourites")
                    .font(.headline)
            }
            .padding(5)

            FavouriteDogsList()
                .listStyle(.inset)
        }
    }
}


#Preview {
    HomeScreen()
        .environment(DogViewModel(service: MockDogService()))
}
