//
//  DogImageListView.swift
//  DogFinder
//
//  Created by Grace couch on 25/04/2024.
//

import SwiftUI

struct DogImageListView: View {
    @Environment(\.dogService) var dogService
    @State var dogImages: [DogImage] = []
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(dogImages) { dogImage in
                    DogImageView(dogImage: dogImage)
                        .frame(height: 350)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .border(Color.black, width: 5)

                   PawSeparator()
                }
            }
            .padding(.horizontal)
        }
        .task {
            dogImages = await dogService.loadImages(id: nil)
        }
    }
}

#Preview {
    DogImageListView()
        .environment(\.dogService, MockDogService())
}
