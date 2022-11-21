//
//  AlbumsContract.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAlbumsProtocol: AnyObject {
    func onFetchAlbumsSuccess()
    func onFetchAlbumsFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func deselectRowAt(row: Int)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAlbumsProtocol: AnyObject {
    var view: PresenterToViewAlbumsProtocol? { get set }
    var interactor: PresenterToInteractorAlbumsProtocol? { get set }
    var router: PresenterToRouterAlbumsProtocol? { get set }
    
    var titlesStrings: [String]? { get set }
    var thumbnailUrlStrings: [String]? { get set }

    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    func textLabelThumbnailImageUrl(indexPath: IndexPath) -> URL?

    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAlbumsProtocol: AnyObject {
    var presenter: InteractorToPresenterAlbumsProtocol? { get set }
    
    func loadAlbums()
    func retrieveAlbum(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAlbumsProtocol: AnyObject {
    func fetchAlbumsSuccess(albums: [Album])
    func fetchAlbumsFailure(errorCode: Int)
    
    func getAlbumSuccess(_ album: Album)
    func getAlbumFailure()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAlbumsProtocol: AnyObject {
    static func createModule() -> UINavigationController
    
    func pushToAlbumDetail(on view: PresenterToViewAlbumsProtocol, with album: Album)
}
