//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 21/02/24.
//

import Foundation

struct CharacterListResponse: Codable {
    var results: [CharacterResponse]
}

struct CharacterResponse: Codable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
    let url: String
}
