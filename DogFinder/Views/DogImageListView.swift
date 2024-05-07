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
            LazyVStack {
                ForEach(dummyData.dogExample) { dogImage in
                    DogImageView(dogImage: dogImage)
                        .frame(height: 350)
                        .frame(width: .infinity)
                        .clipped()
                        .border(Color.black, width: 5)

                   PawSeparator()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DogImageListView()
        .environment(DummyData())
}
