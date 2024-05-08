//
//  HomeScreen.swift
//  DogFinder
//
//  Created by Grace couch on 08/05/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dogService) var dogService
    @State private var selection: Tab = .home
    enum Tab {
        case home
        case dogList
        case imageView
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            DogListView()
                .tabItem {
                    Label("Breed List", systemImage: "list.bullet")
                }
                .tag(Tab.dogList)

            DogImageListView()
                .tabItem {
                    Label("Dog Images", systemImage: "photo")
                }
                .tag(Tab.imageView)
        }
    }
}

#Preview {
    ContentView()
        .environment(\.dogService, MockDogService())
}

