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
                        DogBreedProfileWrapperView(breedInfo: $breed)
                    } label: {
                        BreedListView(dogProfile: breed)
                    }
                }
            }
        }
    }
}

private struct DogBreedProfileWrapperView: View {
    @Binding var breedInfo: BreedInfo
    @State var internalBreedInfo: BreedInfo

    init(breedInfo: Binding<BreedInfo>) {
        self._breedInfo = breedInfo
        self._internalBreedInfo = State(initialValue: breedInfo.wrappedValue)
    }

    var body: some View {
        DogBreedProfile(breedInfo: $internalBreedInfo)
            .onDisappear {
                breedInfo = internalBreedInfo
            }
    }
}


#Preview {
    FavouriteDogsList()
        .environment(DogViewModel(service: MockDogService()))
}
