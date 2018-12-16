//
//  Comments.swift
//  NewProject
//
//  Created by Гузель on 14/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

struct Comments {
    
    var count           : Int?
    var canPost         : Int?
    var groupsCanPost   : Bool?
    
    enum CodingKeys: String, CodingKey {

        case count
        case canPost = "can_post"
        case groupsCanPost = "groups_can_post"

    }
    
}

extension Comments: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(canPost, forKey: .canPost)
        try container.encode(groupsCanPost, forKey: .groupsCanPost)
    }
    
}

extension Comments: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try? container.decode(Int.self, forKey: .count)
        canPost = try? container.decode(Int.self, forKey: .canPost)
        groupsCanPost = try? container.decode(Bool.self, forKey: .groupsCanPost)
    }
    
}

