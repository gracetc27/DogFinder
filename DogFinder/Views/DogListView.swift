//
//  ContentView.swift
//  DogFinder
//
//  Created by Grace couch on 24/04/2024.
//

import SwiftUI

struct DogListView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("Staffy")
                Text("Weimeraner")
                Text("Pug")
            }
            .navigationTitle( "Dog Breeds:" )
        } detail: {
            Text("Select a dog breed")
        }
    }
}
#Preview {
    DogListView()
}
