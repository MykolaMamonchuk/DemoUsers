//
//  PostML.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Foundation

struct PostML: Codable, Equatable, Hashable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?

    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }

//    It's needed to remove duplicates symbols
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (left: PostML, right: PostML) -> Bool {
        return left.id == right.id
    }
}
