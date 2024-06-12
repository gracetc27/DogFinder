//
//  DogImageListView.swift
//  DogFinder
//
//  Created by Grace couch on 25/04/2024.
//

import SwiftUI

struct DogImageListView: View {
    @Environment(DogViewModel.self) var dogViewModel
    @State var dogImages: [DogImage] = []
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(dogImages) { dogImage in
                    DogImageView(dogImage: dogImage)
                        .frame(height: 350)
                        .frame(maxWidth: .infinity)
                        .clipped()
                       

                   PawSeparator()
                }
            }
        }
        .task {
          dogImages = await dogViewModel.loadImages(nil)
        }
    }
}

#Preview {
    DogImageListView()
        .environment(DogViewModel(service: MockDogService()))
}
