//
//  AlbumDetailInteractor.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import Foundation
import Kingfisher

class AlbumDetailInteractor: PresenterToInteractorAlbumDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterAlbumDetailProtocol?
    var album: Album?
    
    //Interactor receives the request from Presenter to get image URl from string
    func getImageUrlFromString() {
        guard let album = album, let url = URL(string: album.imageUrl)  else {
            return
        }
        var placeholder: UIImage? = nil
        //First, check if we have a cached thumbnail image to use as placeholder
        ImageCache.default.retrieveImage(forKey: album.thumbnailUrl) { result in
            switch result {
            case .success(let value):
                placeholder = value.image
            case .failure(let error):
                print(error)
            }
        }
        //Second, provide the imagedownloader with urlString received from server and the cached thumbnail image
        self.presenter?.getImageSuccess(title: album.title, imageUrl: url, placeholder: placeholder)
    }
}
