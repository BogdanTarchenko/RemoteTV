//
//  StorageService.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation

protocol StorageServiceProtocol {
    func save<T: Encodable>(_ value: T, forKey key: String) async throws
    func load<T: Decodable>(forKey key: String) async throws -> T?
}

final class StorageService: StorageServiceProtocol {
    func save<T: Encodable>(_ value: T, forKey key: String) async throws {
        let data = try JSONEncoder().encode(value)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func load<T: Decodable>(forKey key: String) async throws -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
