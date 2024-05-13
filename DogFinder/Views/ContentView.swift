//
//  HomeScreen.swift
//  DogFinder
//
//  Created by Grace couch on 08/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    enum Tab {
        case home
        case dogList
        case imageView
    }
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                HomeScreen()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)
            NavigationStack {
                DogListView()
                    .navigationTitle("Dog Breeds:")
            }

            .tabItem {
                Label("Breed List", systemImage: "list.bullet")
            }
            .tag(Tab.dogList)
            NavigationStack {
                DogImageListView()
            }
            .tabItem {
                Label("Dog Images", systemImage: "photo")
            }
            .tag(Tab.imageView)
        }
    }
}

#Preview {
    ContentView()
        .environment(DogViewModel(service: MockDogService()))
}

