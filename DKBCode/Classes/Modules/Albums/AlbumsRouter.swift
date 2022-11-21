//
//  AlbumsRouter.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import UIKit

class AlbumsRouter: PresenterToRouterAlbumsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        //AlbumsRouter creates the AlbumsRouter module
        let viewController = AlbumsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let presenter: ViewToPresenterAlbumsProtocol & InteractorToPresenterAlbumsProtocol = AlbumsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AlbumsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AlbumsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
    func pushToAlbumDetail(on view: PresenterToViewAlbumsProtocol, with album: Album) {
        //AlbumsRouter is instructed to push AlbumDetailViewController onto the navigation stack
        let AlbumDetailViewController = AlbumDetailRouter.createModule(with: album)
            
        let viewController = view as! AlbumsViewController
        viewController.navigationController?
            .pushViewController(AlbumDetailViewController, animated: true)
        
    }
    
}
