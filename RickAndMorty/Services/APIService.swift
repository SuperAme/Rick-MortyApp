//
//  APIService.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 21/02/24.
//

import Foundation

class APIService: APIServiceProtocol {
    func getAllCharacters(url: URL?, completion: @escaping (Result<CharacterListResponse, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let characters = try decoder.decode(CharacterListResponse.self, from: data)
                    completion(Result.success(characters))
                } catch {
                    completion(Result.failure(APIError.parseError(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
