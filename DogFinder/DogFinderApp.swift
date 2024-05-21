//
//  DogFinderApp.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

@main
struct DogFinderApp: App {
    @State var dogViewModel = DogViewModel(service: DogApiService())
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dogViewModel)
                .onChange(of: scenePhase) { _, newPhase in
                    Task {
                       if newPhase == .inactive { try? await dogViewModel.saveFavouriteBreeds() }
                    }
                }
                .task {
                    try? await dogViewModel.loadFavouriteBreeds()
                }
                .task {
                    await dogViewModel.fetchBreeds()
                }
        }
    }
}
