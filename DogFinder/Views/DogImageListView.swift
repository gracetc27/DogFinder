//
//  DogImageListView.swift
//  DogFinder
//
//  Created by Grace couch on 25/04/2024.
//

import SwiftUI

struct DogImageListView: View {
    @Environment(DummyData.self) var dummyData
    var body: some View {
        ScrollView {
            VStack {
                ForEach(dummyData.dogExample) { dogImage in
                    DogImageView(dogImage: dogImage)
                }
            }
        }
        .padding(.horizontal)
        .background(Gradient(colors: [.teal, .white, .teal]))
    }
}

#Preview {
    DogImageListView()
        .environment(DummyData())
}
