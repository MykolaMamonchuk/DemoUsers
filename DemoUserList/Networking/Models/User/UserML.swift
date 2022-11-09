//
//  UserML.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Foundation

class UserML: Codable {
    var userId: Int?
    var name: String?
    var mediumImg: String?
    var smallImg: String?
    var albumId: Int?
    var posts: [PostML]?

    enum CodingKeys: String, CodingKey {
        case userId, name, albumId, mediumImg = "url", smallImg = "thumbnailUrl"
    }
}
