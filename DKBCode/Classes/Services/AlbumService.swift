//
//  AlbumService.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.
//

import ObjectMapper

class AlbumService {
    
    static let shared = { AlbumService() }()
    
    func getAlbums(success: @escaping (Int, [Album]) -> (), failure: @escaping (Int) -> ()) {
        
        let urlEndpoint = Endpoints.albums
        
        APIClient.shared.getArray(urlString: urlEndpoint, success: { (code, arrayOfAlbums) in
            success(code, arrayOfAlbums)
        }) { (code) in
            failure(code)
        }
    }
    
    func getSingleAlbum(_ albumId: Int, success: @escaping (Int, Album) -> (), failure: @escaping (Int) -> ()) {
        
        let urlEndpoint = Endpoints.albums + "/\(albumId)"
        
        APIClient.shared.getDict(urlString: urlEndpoint, success: { (code, album) in
            success(code, album)
        }) { (code) in
            failure(code)
        }
    }
}
