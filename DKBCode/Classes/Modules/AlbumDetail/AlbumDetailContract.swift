//
//  AlbumDetailContract.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import UIKit


protocol PresenterToViewAlbumDetailProtocol: AnyObject {
    func onGetImageSuccess(_ title: String,_ imageUrl: URL,_ placeholder: UIImage?)
    func onGetImageFailure(_ title: String)
}


protocol ViewToPresenterAlbumDetailProtocol: AnyObject {
    var view: PresenterToViewAlbumDetailProtocol? { get set }
    var interactor: PresenterToInteractorAlbumDetailProtocol? { get set }
    var router: PresenterToRouterAlbumDetailProtocol? { get set }

    func viewDidLoad()
}


protocol PresenterToInteractorAlbumDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterAlbumDetailProtocol? { get set }
    
    var album: Album? { get set }
    
    func getImageUrlFromString()
}


protocol InteractorToPresenterAlbumDetailProtocol: AnyObject {
    func getImageSuccess(title: String, imageUrl: URL, placeholder: UIImage?)
    func getImageFailure(title: String, error: Error)
}


protocol PresenterToRouterAlbumDetailProtocol: AnyObject {
    static func createModule(with album: Album) -> UIViewController
}
