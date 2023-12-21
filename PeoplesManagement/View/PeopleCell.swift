//
//  PeopleCell.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import SwiftUI

struct PeopleCell: View {
    var person: People
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: person.avatar)) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
            } placeholder: {
                ProgressView()
                    .frame(width: 75, height: 75)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("\(person.firstName) \(person.lastName)")
                }
                    .font(.title3)
                    .fontWeight(.heavy)
                Group {
                    HStack {
                        Text("Favorite color: \(person.favouriteColor.capitalized)")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Title: \(person.jobTitle)")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.caption)
            }
        }
    }
}

#Preview {
    PeopleCell(person: People(createdAt: "", firstName: "", avatar: "", lastName: "", email: "", jobTitle: "", id: "1", favouriteColor: ""))
}
