//
//  FavouriteDogsList.swift
//  DogFinder
//
//  Created by Grace couch on 21/05/2024.
//

import SwiftUI

struct FavouriteDogsList: View {
    @Environment(DogViewModel.self) var dogViewModel

    var body: some View {
        @Bindable var dogViewModel = dogViewModel
        List {
            ForEach($dogViewModel.breeds) { $breed in
                if $breed.isFavourite.wrappedValue {
                    NavigationLink {
                        DogBreedProfile(breedInfo: $breed)
                    } label: {
                        BreedListView(dogProfile: breed)
                    }
                }
            }
        }
    }
}


#Preview {
    FavouriteDogsList()
        .environment(DogViewModel(service: MockDogService()))
}
