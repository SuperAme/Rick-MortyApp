//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var characterFetcher: CharactersViewModel
    
    var body: some View {
        VStack {
            Text(characterFetcher.errorMessage ?? "Error")
        }
        
        Button {
            characterFetcher.fetchAllCharacters()
        } label: {
            Text("Try again!")
        }
    }
}

#Preview {
    ErrorView(characterFetcher: CharactersViewModel())
}
