//
//  PeopleDataRepository.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 12/21/23.
//

import Foundation

protocol PeopleDataRepositoryActions {
    func getListOfPeople() async throws -> [People]
}

class PeopleDataRepository {
    var manager: Networking
    
    init(manager: Networking = NetworkManager()) {
        self.manager = manager
    }
}

extension PeopleDataRepository: PeopleDataRepositoryActions {
    func getListOfPeople() async throws -> [People] {
        do {
            guard let url = URL(string: APIEndpoint.peopleListEndPoint) else { throw NetworkError.badUrl }
            
            if let retVal = try await self.manager.getDataFromNetworkLayer(url: url, type: [People].self) {
                return retVal
            } else {
                throw NetworkError.dataNotFound
            }
        } catch {
            throw error
        }
    }
}
