//
//  HomeScreen.swift
//  DogFinder
//
//  Created by Grace couch on 08/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                Label("Dog Of The Day", systemImage: "pawprint.fill")
                    .font(.headline)
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
