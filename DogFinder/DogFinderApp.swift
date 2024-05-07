//
//  DogFinderApp.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

@main
struct DogFinderApp: App {
    var body: some Scene {
        WindowGroup {
            DogListView()
                .environment(\.dogService, MockDogService())
        }
    }
}
