//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Americo Meneses on 22/02/24.
//

import XCTest
import Combine
@testable import RickAndMorty

final class RickAndMortyTests: XCTestCase {

    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_characters_success() {
        let result = Result<CharacterListResponse, APIError>.success(CharacterMock.characterMock())
        
        let fetcher = CharactersViewModel(service: APIMockService(result: result))
        
        let promise = expectation(description: "getting characters")
        
        fetcher.$characters.sink { characters in
            if characters.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
       
        wait(for: [promise], timeout: 2)
    }
    
    func test_loading_error() {
       
         let result = Result<CharacterListResponse, APIError>.failure(APIError.badURL)
         let fetcher = CharactersViewModel(service: APIMockService(result: result))
         
        let promise = expectation(description: "show error message")
        fetcher.$characters.sink { characters in
            if !characters.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
}
