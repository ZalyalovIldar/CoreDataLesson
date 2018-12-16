//
//  Post.swift
//  NewProject
//
//  Created by Гузель on 14/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

struct Post {

    var id          : Int?
    var date        : Date?
    var postType    : String?
    var text        : String?
    var likes       : Likes?
    var attachments : [Attachment]?
    
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case date
        case postType = "post_type"
        case text
        case likes
        case attachments
    }
    
}

extension Post: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(postType, forKey: .postType)
        try container.encode(text, forKey: .text)
        try container.encode(likes, forKey: .likes)
        try container.encode(attachments, forKey: .attachments)
    }
    
}

extension Post: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        date = try? container.decode(Date.self, forKey: .date)
        postType = try? container.decode(String.self, forKey: .postType)
        text = try? container.decode(String.self, forKey: .text)
        likes = try? container.decode(Likes.self, forKey: .likes)
        attachments = try? container.decode([Attachment].self, forKey: .attachments)
    }
}


