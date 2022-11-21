//
//  MockApiResponseModule.swift
//  DKBCodeTests
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.
//

import Foundation

struct MockApiResponseModule  {
    let albumOne: Album?
    
    private let dummyAlbumData: [String : Any] = [
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    ]
    
    init?() {
        self.albumOne = Album(JSON: dummyAlbumData)
    }
    
}
