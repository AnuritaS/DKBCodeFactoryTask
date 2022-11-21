//
//  Album.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import ObjectMapper

struct Album: Mappable {
    
    var title: String
    var imageUrl: String
    var thumbnailUrl: String
    var id: Int
    
    init?(map: Map) {
        title = ""
        imageUrl  = ""
        thumbnailUrl = ""
        id = Int.min
    }
    
    mutating func mapping(map: Map) {
        title              <- map["title"]
        imageUrl           <- map["url"]
        thumbnailUrl       <- map["thumbnailUrl"]
        id                 <- map["id"]
    }
    
}
