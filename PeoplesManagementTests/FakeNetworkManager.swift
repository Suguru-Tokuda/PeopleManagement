//
//  FakeNetworkManager.swift
//  PeoplesManagementTests
//
//  Created by Suguru Tokuda on 11/10/23.
//

import Foundation
@testable import PeoplesManagement

class FakeNetworkManager: Networking {   
    func getDataFromNetworkLayer<T>(url: URL, type: T.Type) async throws -> T? where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        
        guard let url = url else { throw NetworkError.badUrl }
        var rawData: Data
        
        do {
            rawData = try Data(contentsOf: url)
        } catch {
            throw NetworkError.dataNotFound
        }
        
        do {
            let result = try JSONDecoder().decode(type, from: rawData)
            return result
        } catch {
            throw NetworkError.parsing
        }
    }
}
