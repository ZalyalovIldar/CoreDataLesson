//
//  Profile.swift
//  NewProject
//
//  Created by Rustam on 14/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import  Foundation

struct User {
    
    var firstName       : String?
    var lastName        : String?
    var sex             : Int?
    var relation        : Int?
    var bdate           : Date?
    var bdateVisibility : Int?
    var homeTown        : String?
    var country         : Country?
    var city            : City?
    var status          : String?
    var phone           : String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case firstName = "first_name"
        case lastName = "last_name"
        case sex
        case relation
        case bdate
        case bdateVisibility = "bdate_visibility"
        case homeTown = "home_town"
        case country
        case city
        case status
        case phone
    }
    
}

extension User: Encodable {
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(sex, forKey: .sex)
        try container.encode(relation, forKey: .relation)
        try container.encode(bdate, forKey: .bdate)
        try container.encode(bdateVisibility, forKey: .bdateVisibility)
        try container.encode(homeTown, forKey: .homeTown)
        try container.encode(country, forKey: .country)
        try container.encode(city, forKey: .city)
        try container.encode(status, forKey: .status)
        try container.encode(phone, forKey: .phone)

    }
    
}

extension User: Decodable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try? container.decode(String.self, forKey: .firstName)
        lastName = try? container.decode(String.self, forKey: .lastName)
        sex = try? container.decode(Int.self, forKey: .sex)
        relation = try? container.decode(Int.self, forKey: .relation)
        bdate = try? container.decode(Date.self, forKey: .bdate)
        bdateVisibility = try? container.decode(Int.self, forKey: .bdateVisibility)
        homeTown = try? container.decode(String.self, forKey: .homeTown)
        country = try? container.decode(Country.self, forKey: .country)
        city = try? container.decode(City.self, forKey: .city)
        status = try? container.decode(String.self, forKey: .status)
        phone = try? container.decode(String.self, forKey: .phone)

    }
}


