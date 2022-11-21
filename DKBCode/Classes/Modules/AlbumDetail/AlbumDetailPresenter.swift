//
//  AlbumDetailPresenter.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import Foundation
import UIKit

class AlbumDetailPresenter: ViewToPresenterAlbumDetailProtocol {

    // MARK: Properties
    weak var view: PresenterToViewAlbumDetailProtocol?
    var interactor: PresenterToInteractorAlbumDetailProtocol?
    var router: PresenterToRouterAlbumDetailProtocol?
    
    //Presenter is being notified that the View was loaded
    func viewDidLoad() {
        interactor?.getImageUrlFromString()
    }
}

extension AlbumDetailPresenter: InteractorToPresenterAlbumDetailProtocol {

    func getImageSuccess(title: String, imageUrl: URL, placeholder: UIImage?) {
        view?.onGetImageSuccess(title, imageUrl, placeholder)
    }
    
    func getImageFailure(title: String, error: Error) {
        print("Loading the image failed with error:", error)
        view?.onGetImageFailure(title)
    }
}
