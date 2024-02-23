//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

struct DetailView: View {
    let character: CharacterResponse
    
    var body: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Text(character.name)
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        
                    Divider()
                        .foregroundColor(.secondary)
                
                    Text("Status: \(String(describing: character.status.rawValue))".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                    
                    Divider()
                        .foregroundColor(.secondary)
                    
                    Text("Specie: \(String(describing: character.species))".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                    
                    Divider()
                        .foregroundColor(.secondary)
                    
                    Text("Type: \(String(describing: character.type))".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                    
                    Divider()
                        .foregroundColor(.secondary)
                    
                    Text("Gender: \(String(describing: character.gender.rawValue))".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                    
                    Divider()
                        .foregroundColor(.secondary)
                    
                    Text("Origin: \(String(describing: character.origin.name))".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                    
                    Divider()
                        .foregroundColor(.secondary)
                }
                .padding(20)
                .padding(.vertical, 10)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .cornerRadius(30)
                        .blur(radius: 30)
                )
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                )
                .offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: 200)
                .padding(20)
            )
        }
        .frame(height: 500)
    }
}
