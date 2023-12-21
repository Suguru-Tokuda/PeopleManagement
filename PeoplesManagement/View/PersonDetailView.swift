//
//  PersonDetailView.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/24/23.
//

import SwiftUI

struct PersonDetailView: View {
    var person: People?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PersonDetailView(person: People(createdAt: "", firstName: "", avatar: "'", lastName: "", email: "", jobTitle: "", id: "", favouriteColor: ""))
}
