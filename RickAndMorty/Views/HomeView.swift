//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

struct HomeView: View {
    let characters: [CharacterResponse]?
    
    @State private var searchText: String = ""
    
    var filteredCharacters: [CharacterResponse]? {
        if searchText.count == 0 {
            return characters
        } else {
            return characters!.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(filteredCharacters!) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            CharacterRow(character: character)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("The Rick & Morty App")
                .searchable(text: $searchText)
            }
        }
    }
}
