//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: CharacterResponse
    let imageSize: CGFloat = 100
    
    var body: some View {
        ImageView(character: character)
        DetailView(character: character)
    }
}
