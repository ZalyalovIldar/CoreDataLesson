//
//  MainService.swift
//  NewProject
//
//  Created by Гузель on 15/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

enum MainServiceBaseResult {
    case success(User)
    case failure(Error)
}

enum MainServicePostResult {
    case success([Post])
    case failure(Error)
}
protocol MainService {
    
    func profile(completion: @escaping (MainServiceBaseResult) -> Void)
    
    func wallPosts(limit: Int, offset: Int, completion: @escaping (MainServicePostResult) -> Void)
    
}
