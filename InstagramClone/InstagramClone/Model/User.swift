//
//  User.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/9/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "batman-2", fullname: "Bruce Wayne", bio: "Gotham's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: "venom-2", fullname: "Eddie Brock", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: "iron-man-1", fullname: "Tony Stark", bio: "Playboy & Billionaire", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: "black-panther-2", fullname: "T'Challa", bio: "King of the Dead", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: "spiderman", fullname: "Peter Parker", bio: "Bray Bray's FAVE", email: "spiderman@gmail.com")
    ]
}
