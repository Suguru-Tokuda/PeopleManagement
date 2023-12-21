//
//  StartView.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/24/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(page: .home)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page: page)
                }
        }
    }
}

#Preview {
    StartView()
}
