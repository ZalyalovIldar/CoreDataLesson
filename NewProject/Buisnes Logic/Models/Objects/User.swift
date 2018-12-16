//
//  Profile.swift
//  NewProject
//
//  Created by Гузель on 14/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import  Foundation

struct User {
    
    var id              : Int?
    var firstName       : String?
    var lastName        : String?
    var isClosed        : Bool?
    var canAccessClosed : Bool?
    var sex             : Int?
    var city            : City?
    var country         : Country?
    var photoOrig       : String?
    var online          : Int?
    var status          : String?
    var counters        : Counters?
    var mobilePhone     : String?
    var homeTown        : String?
    var bdate           : String?
    var interests       : String?
    var about           : String?
    var lastSeenDate    : Date?
    var lastSeenPlatform: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case sex
        case country
        case city
        case photoOrig = "photo_200_orig"
        case online
        case bdate
        case homeTown = "home_town"
        case status
        case mobilePhone = "mobile_phone"
        case counters
        case interests
        case about
        case lastSeen = "last_seen"
    }
    
    enum LastSeenKeys: String, CodingKey {
        case time
        case platform
    }
    
}



extension User: Encodable {
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(isClosed, forKey: .isClosed)
        try container.encode(canAccessClosed, forKey: .canAccessClosed)
        try container.encode(sex, forKey: .sex)
        try container.encode(photoOrig, forKey: .photoOrig)
        try container.encode(online, forKey: .online)
        try container.encode(homeTown, forKey: .homeTown)
        try container.encode(bdate, forKey: .bdate)
        try container.encode(country, forKey: .country)
        try container.encode(city, forKey: .city)
        try container.encode(status, forKey: .status)
        try container.encode(mobilePhone, forKey: .mobilePhone)
        try container.encode(counters, forKey: .counters)
        try container.encode(about, forKey: .about)
        try container.encode(interests, forKey: .interests)
        
        var lastSeenContainer = encoder.container(keyedBy: LastSeenKeys.self)
        try lastSeenContainer.encode(lastSeenDate, forKey: .time)
        try lastSeenContainer.encode(lastSeenPlatform, forKey: .platform)
        
    }
    
}

extension User: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        firstName = try? container.decode(String.self, forKey: .firstName)
        lastName = try? container.decode(String.self, forKey: .lastName)
        isClosed = try? container.decode(Bool.self, forKey: .isClosed)
        canAccessClosed = try? container.decode(Bool.self, forKey: .canAccessClosed)
        sex = try? container.decode(Int.self, forKey: .sex)
        photoOrig = try? container.decode(String.self, forKey: .photoOrig)
        online = try? container.decode(Int.self, forKey: .online)
        homeTown = try? container.decode(String.self, forKey: .homeTown)
        bdate = try? container.decode(String.self, forKey: .bdate)
        country = try? container.decode(Country.self, forKey: .country)
        city = try? container.decode(City.self, forKey: .city)
        status = try? container.decode(String.self, forKey: .status)
        mobilePhone = try? container.decode(String.self, forKey: .mobilePhone)
        counters = try? container.decode(Counters.self, forKey: .counters)
        about = try? container.decode(String.self, forKey: .about)
        interests = try? container.decode(String.self, forKey: .interests)
        
        let lastSeenContainer = try container.nestedContainer(keyedBy: LastSeenKeys.self, forKey: .lastSeen)
        lastSeenDate = try lastSeenContainer.decode(Date.self, forKey: .time)
        lastSeenPlatform = try lastSeenContainer.decode(Int.self, forKey: .platform)
        
    }
}


