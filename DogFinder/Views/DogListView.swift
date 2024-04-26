//
//  ContentView.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogListView: View {
    @Environment(DummyData.self) var dummyData
    var body: some View {
        NavigationStack {
            List {
                ForEach(dummyData.breedInfoExample) { breed in
                    NavigationLink {
                        DogBreedProfile(breedInfo: breed)
                    }
                label: {
                    BreedListView(dogProfile: breed)
                }
                }
            }
            .navigationTitle("Dog Breeds:")
        }
    }
}


#Preview {
    DogListView()
        .environment(DummyData())
}
