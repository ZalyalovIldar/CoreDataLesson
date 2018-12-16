//
//  Photo.swift
//  NewProject
//
//  Created by Гузель on 14/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

struct Photo {
    
    var id          : Int?
    var accessKey   : String?
    var date        : Date?
    var photoSize   : [PhotoSize]?

    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case accessKey = "access_key"
        case photoSize = "sizes"
    }
    
    
}

extension Photo: Encodable {
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(accessKey, forKey: .accessKey)
        try container.encode(photoSize, forKey: .photoSize)
    }
    
}

extension Photo: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        accessKey = try? container.decode(String.self, forKey: .accessKey)
        date = try? container.decode(Date.self, forKey: .date)
        photoSize = try? container.decode([PhotoSize].self, forKey: .photoSize)
    
    }
}
