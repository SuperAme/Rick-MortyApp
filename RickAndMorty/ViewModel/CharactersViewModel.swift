//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

class CharactersViewModel: ObservableObject {
    @Published var characters = [CharacterResponse]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllCharacters()
    }
    
    func fetchAllCharacters() {
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: BaseURL.baseURL + BaseURL.character)
        service.getAllCharacters(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let characters):
                    self.characters = characters.results
                }
            }
        }
    }
}
