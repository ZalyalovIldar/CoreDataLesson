//
//  PostResponseBody.swift
//  NewProject
//
//  Created by Гузель on 16/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

struct PostResponseBody: Codable {
    
    var response: [Post]?
    var count: Int?
    
}
