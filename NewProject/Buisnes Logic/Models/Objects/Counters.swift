//
//  Counters.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

struct Counters {
    
    var albums          : Int?
    var videos          : Int?
    var audios          : Int?
    var notes           : Int?
    var photos          : Int?
    var groups          : Int?
    var gifts           : Int?
    var friends         : Int?
    var onlineFriends   : Int?
    var userPhotos      : Int?
    var followers       : Int?
    var subscriptions   : Int?
    var pages           : Int?
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case albums
        case videos
        case audios
        case notes
        case photos
        case groups
        case gifts
        case friends
        case onlineFriends = "online_friends"
        case userPhotos = "user_photos"
        case followers
        case subscriptions
        case pages

    }
    
}

extension Counters: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(albums, forKey: .albums)
        try container.encode(videos, forKey: .videos)
        try container.encode(audios, forKey: .audios)
        try container.encode(notes, forKey: .notes)
        try container.encode(photos, forKey: .photos)
        try container.encode(groups, forKey: .groups)
        try container.encode(gifts, forKey: .gifts)
        try container.encode(friends, forKey: .friends)
        try container.encode(onlineFriends, forKey: .onlineFriends)
        try container.encode(userPhotos, forKey: .userPhotos)
        try container.encode(followers, forKey: .followers)
        try container.encode(subscriptions, forKey: .subscriptions)
        try container.encode(pages, forKey: .pages)
     
    }
    
}

extension Counters: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        albums = try? container.decode(Int.self, forKey: .albums)
        videos = try? container.decode(Int.self, forKey: .videos)
        audios = try? container.decode(Int.self, forKey: .audios)
        notes = try? container.decode(Int.self, forKey: .notes)
        photos = try? container.decode(Int.self, forKey: .photos)
        groups = try? container.decode(Int.self, forKey: .groups)
        gifts = try? container.decode(Int.self, forKey: .gifts)
        friends = try? container.decode(Int.self, forKey: .friends)
        onlineFriends = try? container.decode(Int.self, forKey: .onlineFriends)
        userPhotos = try? container.decode(Int.self, forKey: .userPhotos)
        followers = try? container.decode(Int.self, forKey: .followers)
        subscriptions = try? container.decode(Int.self, forKey: .subscriptions)
        pages = try? container.decode(Int.self, forKey: .pages)
        
    }
    
}
