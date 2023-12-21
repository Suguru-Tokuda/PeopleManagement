//
//  MainCoordinator.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/24/23.
//

import Foundation
import SwiftUI

@MainActor
class MainCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    var person: People?
    
    func startCoordinator() {
        path.append(MyPage.home)
    }
    
    func goToDetailsScreen(person: People) {
        path.append(MyPage.details)
        self.person = person
    }
    
    func goToListScreen() {
        path.append(MyPage.list)
    }
    
    @ViewBuilder
    func getPage(page: MyPage) -> some View {
        switch page {
        case .list:
            EmptyView()
        case .home:
            PeopleListView()
        case .gridscreen:
            GridScreen()
        case .details:
            PersonDetailView(person: person)
        }
    }
}

enum MyPage: String, CaseIterable, Identifiable {
    case home, details, list, gridscreen
    
    var id: String { self.rawValue }
}
