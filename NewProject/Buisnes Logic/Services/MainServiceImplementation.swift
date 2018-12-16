//
//  MainServiceImplementation.swift
//  NewProject
//
//  Created by Гузель on 15/12/2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import Foundation

class MainServiceImplementation: MainService {
    
    func profile(completion: @escaping (MainServiceBaseResult) -> Void) {
        
        //todo add error message
        guard let token = UserDefaultsSettings.currentAccessToken() else {
            print("not token")
            completion(.failure(NSError(domain:"", code: 1, userInfo:[ NSLocalizedDescriptionKey: "Invaild access token"]) as Error))
            return
            
        }

        let urlComponents = NSURLComponents(string: URLStringsHelper.string(for: .baseURL) + URLStringsHelper.string(for: .getUser))!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: UserDefaultsSettings.currentUserID()),
            URLQueryItem(name: "v", value: URLStringsHelper.string(for: .apiVersion)),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "fields", value: "about,bdate,city,counters,contacts,country,home_town,interests, last_seen,online,photo_200_orig,sex,status")
        ]

        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
     
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(.failure(NSError(domain:"", code: 1, userInfo:[ NSLocalizedDescriptionKey: error?.localizedDescription ?? ""]) as Error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain:"", code: 1, userInfo: nil) as Error))
                return
            }
           
            do {
        
                let userResponse: UserResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                guard let user = userResponse.response?.first else {
                    completion(.failure(NSError(domain:"", code: 1, userInfo: nil) as Error))
                    return
                }
                completion(.success(user))
                return
            } catch  {
                completion(.failure(NSError(domain:"", code: 1, userInfo: nil) as Error))
            }
        })
        
        task.resume()
    }
    
    
    func wallPosts(limit: Int, offset: Int, completion: @escaping (MainServicePostResult) -> Void) {
        
        //todo add error message
        guard let token = UserDefaultsSettings.currentAccessToken() else {
            print("not token")
            completion(.failure(NSError(domain:"", code: 1, userInfo:[ NSLocalizedDescriptionKey: "Invaild access token"]) as Error))
            return
            
        }
        
        let urlComponents = NSURLComponents(string: URLStringsHelper.string(for: .baseURL) + URLStringsHelper.string(for: .wallGet))!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "v", value: URLStringsHelper.string(for: .apiVersion)),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "count", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ]
        
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(.failure(NSError(domain:"", code: 1, userInfo:[ NSLocalizedDescriptionKey: error?.localizedDescription ?? ""]) as Error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain:"", code: 1, userInfo: nil) as Error))
                return
            }
            
            do {
                
                let postResponse: PostResponse = try JSONDecoder().decode(PostResponse.self, from: data)
                guard let posts = postResponse.items else {
                    completion(.failure(NSError(domain:"", code: 1, userInfo: nil) as Error))
                    return
                }
                completion(.success(posts))
                return
            } catch  {
                completion(.failure(NSError(domain:"", code: 1, userInfo: nil) as Error))
            }
        })
        
        task.resume()
    }
    
}
