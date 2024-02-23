//
//  APIMockService.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    var result: Result<CharacterListResponse, APIError>
    
    func getAllCharacters(url: URL?, completion: @escaping (Result<CharacterListResponse, APIError>) -> Void) {
        completion(result)
    }
}
