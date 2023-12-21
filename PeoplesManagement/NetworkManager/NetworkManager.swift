//
//  NetworkManager.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import Foundation
import Combine

protocol Networking {
    func getDataFromNetworkLayer<T: Decodable>(url: URL, type: T.Type) async throws -> T?
//    func getDataFromNetworkLayer<T: Decodable>(url: URL, type: T.Type) -> AnyPublisher<T, Error>
}

class NetworkManager: Networking {
    func getDataFromNetworkLayer<T>(url: URL, type: T.Type) async throws -> T? where T : Decodable {
        do {
            let (rawData, response) = try await URLSession.shared.data(from: url)
            
            guard let res = response as? HTTPURLResponse,
               res.statusCode >= 200 && res.statusCode < 300 else {
                return nil
            }
            
            let processedData = try JSONDecoder().decode(T.self, from: rawData)
            
            return processedData
        } catch {
            throw error
        }        
    }
    
//    func getDataFromNetworkLayer<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//    }
}
