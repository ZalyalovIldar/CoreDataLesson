//
//  Randomizer.swift
//  homework2
//
//  Created by itisioslab on 18.01.2019.
//  Copyright © 2019 FirstGroupCompany. All rights reserved.
//

import Foundation
import CoreData

class Randomizer {
    static func getAndSaveRandomNews(context: NSManagedObjectContext){
        
        let imageArr = ["ava1"," ava2","ava3"]
        
        let imageArr2 = ["ava1"," ava2","ava3", "gift2", "gift3", "gift1", "gift4","profile"]
     
        
        
        let _ = News(context: context,
                surname: surnames[Int(arc4random_uniform(UInt32(surnames.count)))], name: names[Int(arc4random_uniform(UInt32(names.count)))],
                avatar: imageArr[Int(arc4random_uniform(UInt32(imageArr.count)))],
                date: dates[Int(arc4random_uniform(UInt32(dates.count)))], text: asa[Int(arc4random_uniform(UInt32(asa.count)))],
                imageInNews: imageArr2[Int(arc4random_uniform(UInt32(imageArr2.count)))], like: Int(arc4random_uniform(1000)),
                comment: Int(arc4random_uniform(50))
                )
        try? context.save()
        }
    
    
    

}
