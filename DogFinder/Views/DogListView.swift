//
//  ContentView.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogListView: View {
    @Environment(\.dogService) var dogService
    @State var breeds: [BreedInfo] = []
    var body: some View {
        NavigationStack {
            List {
                ForEach(breeds) { breed in
                    NavigationLink {
                        DogBreedProfile(breedInfo: breed)
                    } label: {
                        BreedListView(dogProfile: breed)
                    }
                }
            }
            .navigationTitle("Dog Breeds:")
        }
        .task {
            breeds = await dogService.fetchBreeds()
        }
    }
}


#Preview {
    DogListView()
        .environment(\.dogService, MockDogService())
}
