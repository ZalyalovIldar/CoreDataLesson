//
//  PostResponse.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

struct PostResponse {
    
    var items: [Post]?
    var count: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
    
    enum PostResponseKeys: String, CodingKey {
        case items
        case count
    }
}


extension PostResponse: Encodable {
    
    func encode(to encoder: Encoder) throws {
    
        var postResponseContainer = encoder.container(keyedBy: PostResponseKeys.self)
        try postResponseContainer.encode(items, forKey: .items)
        try postResponseContainer.encode(count, forKey: .count)
        
    }
    
}

extension PostResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let lastSeenContainer = try container.nestedContainer(keyedBy: PostResponseKeys.self, forKey: .response)
        items = try lastSeenContainer.decode([Post].self, forKey: .items)
        count = try lastSeenContainer.decode(Int.self, forKey: .count)
        
    }
}



