//
//  CacheHandlingProtocol.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import Foundation

protocol CacheHandlingProtocol {
    associatedtype Key: Hashable
    associatedtype Value
    
    func save(_ value: Value, forkey key: Key)
    func retrieve(forkey key: Key) -> Value?
    func removeValue(forKey key: Key)
    subscript(key: Key) -> Value? { get set }
}
