//
//  PawSeparator.swift
//  DogFinder
//
//  Created by Grace couch on 07/05/2024.
//

import SwiftUI

struct PawSeparator: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "pawprint.fill")
            Image(systemName: "pawprint.fill")
                .font(.title2)
            Image(systemName: "pawprint.fill")
        }
    }
}

#Preview {
    PawSeparator()
}
