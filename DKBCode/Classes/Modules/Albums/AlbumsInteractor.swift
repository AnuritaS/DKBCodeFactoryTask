//
//  AlbumsInteractor.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import Foundation
import UIKit

class AlbumsInteractor: PresenterToInteractorAlbumsProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterAlbumsProtocol?
    var albums: [Album]?
    
    func loadAlbums() {
        //Interactor receives the request from Presenter to load albums from the server
        AlbumService.shared.getAlbums(success: { (code, albums) in
            self.albums = albums
            self.presenter?.fetchAlbumsSuccess(albums: albums)
        }) { (code) in
            self.presenter?.fetchAlbumsFailure(errorCode: code)
        }
    }
    
    func retrieveAlbum(at index: Int) {
        guard let albums = self.albums, albums.indices.contains(index) else {
            self.presenter?.getAlbumFailure()
            return
        }
        self.presenter?.getAlbumSuccess(self.albums![index])
    }

}
