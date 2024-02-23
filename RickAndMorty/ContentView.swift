//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 21/02/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var characterFetcher = CharactersViewModel()
    var body: some View {
        if characterFetcher.isLoading {
            LoadingView()
        } else if characterFetcher.errorMessage != nil {
            ErrorView(characterFetcher: characterFetcher)
        } else {
            HomeView(characters: characterFetcher.characters)
        }
    }}

#Preview {
    ContentView()
}
