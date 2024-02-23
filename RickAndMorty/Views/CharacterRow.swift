//
//  CharacterRow.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

struct CharacterRow: View {
    let character: CharacterResponse
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            if character.image != nil {
                AsyncImage(url: URL(string: character.image)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(Circle())
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(character.name)
                    .font(.headline)
                Text("Status: \(character.status.rawValue)")
            }
        }
    }
}
