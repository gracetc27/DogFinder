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
        VStack(alignment: .leading) {
            Label("Dog Of The Day", systemImage: "pawprint.fill")
                .font(.title.bold())
                .padding(5)
            DogOfTheDayImage()
                .frame(height: 350)
                .frame(maxWidth: .infinity)
                .clipped()
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                Text("Breed Favourites")
            }
            .font(.title.bold())
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
