//
//  Friend.swift
//  FriendsWar
//
//  Created by 장여훈 on 2023/07/26.
//

import Foundation

struct Friend: Identifiable, Codable {
    var id: String
    var name: String
    var imageURL: String
    var description: String
    var link: String
}
