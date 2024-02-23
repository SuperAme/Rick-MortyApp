//
//  APIServiceProtocol.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 21/02/24.
//

import Foundation

protocol APIServiceProtocol {
    func getAllCharacters(url: URL?, completion: @escaping(Result<CharacterListResponse, APIError>) -> Void)
}
