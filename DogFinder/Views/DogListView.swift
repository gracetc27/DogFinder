//
//  ContentView.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogListView: View {
    @Environment(DogViewModel.self) var dogViewModel
    @State private var searchBreed = ""

    var body: some View {
        @Bindable var dogViewModel = dogViewModel
        List {
            ForEach($dogViewModel.breeds) { $breed in
                if isBreedFiltered(breed: breed) {
                    NavigationLink {
                        DogBreedProfile(breedInfo: $breed)
                    } label: {
                        BreedListView(dogProfile: breed)
                    }
                }
            }
        }
        .task {
            await dogViewModel.fetchBreeds()
        }
        .searchable(text: $searchBreed)
    }

    private func isBreedFiltered(breed: BreedInfo) -> Bool {
        searchBreed.isEmpty || breed.name.contains(searchBreed)
    }
}



#Preview {
    NavigationStack {
        DogListView()
            .environment(DogViewModel(service: MockDogService()))
    }
}
