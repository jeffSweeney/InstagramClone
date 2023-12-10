//
//  Post.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/10/23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, 
              ownerUid: NSUUID().uuidString,
              caption: "Sick new batmobile whattupp",
              likes: Int.random(in: 0...1000),
              imageUrl: "batman",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Who is that cool Bruce Wayne guy??",
              likes: Int.random(in: 0...1000),
              imageUrl: "batman-2",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "No one beats the VENOM pics",
              likes: Int.random(in: 0...1000),
              imageUrl: "venom-1",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Just another sick Venom post",
              likes: Int.random(in: 0...1000),
              imageUrl: "venom-2",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "VENOM FOR LYFEE",
              likes: Int.random(in: 0...1000),
              imageUrl: "venom-10",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "New suit rolling out in Iron Man 7",
              likes: Int.random(in: 0...1000),
              imageUrl: "iron-man-1",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "RIP Chadwick :(",
              likes: Int.random(in: 0...1000),
              imageUrl: "black-panther-1",
              timestamp: Date(),
              user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "This one was the best BP suit",
              likes: Int.random(in: 0...1000),
              imageUrl: "black-panther-2",
              timestamp: Date(),
              user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "I heard that Peter Parker guy is cool",
              likes: Int.random(in: 0...1000),
              imageUrl: "spiderman",
              timestamp: Date(),
              user: User.MOCK_USERS[4]),
    ]
}
