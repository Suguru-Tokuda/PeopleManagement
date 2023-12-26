//
//  PeopleViewModel.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import Foundation

@MainActor // all the value assignment for published variables happen in the main tread.
class PeopleViewModel: ObservableObject {
    @Published var people: [People] = []
    @Published var isErrorOccured: Bool = false
    var customError: NetworkError?
    var repository: PeopleDataRepositoryActions
    
    init(repository: PeopleDataRepositoryActions = PeopleDataRepository()) {
        self.repository = repository
    }
    
    func getDataFromViewModel(urlString: String) async {
        do {
            
            self.people = try await self.repository.getListOfPeople()
        } catch {
            
            switch error {
            case NetworkError.badUrl:
                customError = NetworkError.badUrl
            case NetworkError.parsing:
                customError = NetworkError.parsing
            case NetworkError.dataNotFound:
                customError = NetworkError.dataNotFound
            case NetworkError.serverNotFound:
                customError = NetworkError.serverNotFound
            default:
                customError = NetworkError.dataNotFound
            }
            
            DispatchQueue.main.async {
                self.isErrorOccured = true
            }
        }
    }
    
    func setErrorOccuredToFalse() {
        DispatchQueue.main.async {
            self.isErrorOccured = false
            self.customError = nil
        }
    }
}
