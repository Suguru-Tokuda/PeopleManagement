//
//  PeoplesManagementApp.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import SwiftUI

@main
struct PeoplesManagementApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(MainCoordinator())
        }
    }
}
