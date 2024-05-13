//
//  ContentView.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogListView: View {
    @Environment(DogViewModel.self) var dogViewModel
    
    var body: some View {
        @Bindable var dogViewModel = dogViewModel
            List {
                ForEach($dogViewModel.breeds) { $breed in
                    NavigationLink {
                        DogBreedProfile(breedInfo: $breed)
                    } label: {
                        BreedListView(dogProfile: breed)
                    }
                }
            }
        .task {
            await dogViewModel.fetchBreeds()
        }
    }
}


#Preview {
    DogListView()
        .environment(DogViewModel(service: MockDogService()))
}
