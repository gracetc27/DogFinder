//
//  DogImageView.swift
//  DogFinder
//
//  Created by Grace couch on 25/04/2024.
//

import SwiftUI

struct DogImageView: View {
    let dogImage: DogImage

    var body: some View {
        AsyncImage(url: dogImage.url) { image in
            Color.clear
                .overlay {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    let dummyImageData = DummyData()
    return DogImageView(dogImage: dummyImageData.dogExample[6])
}
