//
//  CharacterMock.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import Foundation

class CharacterMock {
    static func characterMock() -> CharacterListResponse {
        return CharacterListResponse(results: [CharacterResponse(id: 1,
                                                                 name: "Rick Sanchez",
                                                                 status: Status.alive,
                                                                 species: Species.human,
                                                                 type: "",
                                                                 gender: Gender.male,
                                                                 origin: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                                                                 location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                                                                 image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                                                 episode:
                                                                    ["https://rickandmortyapi.com/api/episode/1",
                                                                    "https://rickandmortyapi.com/api/episode/2"],
                                                                 url: "https://rickandmortyapi.com/api/character/1",
                                                                 created: "2017-11-04T18:48:46.250Z")])
    }
}
