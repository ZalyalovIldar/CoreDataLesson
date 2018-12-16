//
//  Likes.swift
//  NewProject
//
//  Created by Гузель on 14/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//


import Foundation

struct Likes {
    
    var count       : Int?
    var userLikes   : Int?
    var canLike     : Int?
    var canPublish  : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case count
        case userLikes = "user_likes"
        case canLike = "can_like"
        case canPublish = "can_publish"
    }
    
}

extension Likes: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(userLikes, forKey: .userLikes)
        try container.encode(canLike, forKey: .canLike)
        try container.encode(canPublish, forKey: .canPublish)
    }
    
}

extension Likes: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try? container.decode(Int.self, forKey: .count)
        userLikes = try? container.decode(Int.self, forKey: .userLikes)
        canLike = try? container.decode(Int.self, forKey: .canLike)
        canPublish = try? container.decode(Int.self, forKey: .canPublish)
    }
    
}
