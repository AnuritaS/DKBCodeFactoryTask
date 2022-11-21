//
//  AlbumDetailRouter.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import Foundation
import UIKit

class AlbumDetailRouter: PresenterToRouterAlbumDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with album: Album) -> UIViewController {
        let viewController = AlbumDetailViewController()
        
        let presenter: ViewToPresenterAlbumDetailProtocol & InteractorToPresenterAlbumDetailProtocol = AlbumDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AlbumDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AlbumDetailInteractor()
        viewController.presenter?.interactor?.album = album
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
