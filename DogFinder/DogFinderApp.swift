//
//  DogFinderApp.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

@main
struct DogFinderApp: App {
    @State private var dummyData = DummyData()
    var body: some Scene {
        WindowGroup {
            DogListView()
                .environment(dummyData)
        }
    }
}
