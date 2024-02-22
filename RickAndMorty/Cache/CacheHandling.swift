//
//  CacheHandling.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import Foundation


class CacheHandling <Key: Hashable, Value>: CacheHandlingProtocol {
    private let wrappped = NSCache<WrappedKey, Entry>()
    
    func save(_ value: Value, forkey key: Key) {
        let entry = Entry(value: value)
        wrappped.setObject(entry, forKey: WrappedKey(key: key))
    }
    
    func retrieve(forkey key: Key) -> Value? {
        let entry = wrappped.object(forKey: WrappedKey(key: key))
        return entry?.value
    }
    
    func removeValue(forKey key: Key) {
        wrappped.removeObject(forKey: WrappedKey(key: key))
    }
    
    subscript(key: Key) -> Value? {
        get {
            return retrieve(forkey: key)
        }
        set {
            guard let value = newValue else {
                removeValue(forKey: key)
                return
            }
            save(value, forkey: key)
        }
    }
}

extension CacheHandling {
    final class WrappedKey: NSObject {
        let key: Key
        
        init(key: Key) {
            self.key = key
        }
        
        override var hash: Int {
            return key.hashValue
        }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else { return false }
            return value.key == key
        }
    }
    
    final class Entry {
        let value: Value
        
        init(value: Value) {
            self.value = value
        }
    }
}
