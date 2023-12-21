//
//  People.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import Foundation

struct People: Codable, Identifiable {
    let createdAt, firstName, avatar, lastName, email, jobTitle, id, favouriteColor: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt,
             firstName,
             avatar,
             lastName,
             email,
             jobTitle = "jobtitle",
             id,
             favouriteColor
    }
}
