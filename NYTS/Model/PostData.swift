//
//  PostData.swift
//  NYTS
//
//  Created by Thahi on 08/07/2021.
//

import Foundation
struct Results: Decodable {
    let results:[Post]
}
struct Post:Decodable, Identifiable {
    var id: String{
        return updated_date
    }
    let updated_date: String
    let title: String
    let url: String
    
    
    
}
