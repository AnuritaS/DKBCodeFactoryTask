//
//  AlbumsPresenter.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import Foundation
import UIKit

class AlbumsPresenter: ViewToPresenterAlbumsProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewAlbumsProtocol?
    var interactor: PresenterToInteractorAlbumsProtocol?
    var router: PresenterToRouterAlbumsProtocol?
    
    var titlesStrings: [String]?
    var thumbnailUrlStrings: [String]?

    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadAlbums()
    }
    
    func refresh() {
        interactor?.loadAlbums()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let titlesStrings = self.titlesStrings else {
            return 0
        }
        
        return titlesStrings.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let titlesStrings = self.titlesStrings else {
            return nil
        }
        
        return titlesStrings[indexPath.row]
    }
    
    func textLabelThumbnailImageUrl(indexPath: IndexPath) -> URL? {
        guard let thumbnailUrlStrings = self.thumbnailUrlStrings, let url = URL(string: thumbnailUrlStrings[indexPath.row]) else {
            return nil
        }
        return url
    }

    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveAlbum(at: index)
    }
    
    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
}

// MARK: - Outputs to view
extension AlbumsPresenter: InteractorToPresenterAlbumsProtocol {
    
    func fetchAlbumsSuccess(albums: [Album]) {
        self.titlesStrings = albums.compactMap { $0.title }
        self.thumbnailUrlStrings = albums.compactMap { $0.thumbnailUrl }
        view?.hideHUD()
        view?.onFetchAlbumsSuccess()
    }
    
    func fetchAlbumsFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchAlbumsFailure(error: "Couldn't fetch albums: \(errorCode)")
    }
    
    func getAlbumSuccess(_ album: Album) {
        guard let view = view else { return }
        router?.pushToAlbumDetail(on: view, with: album)
    }
    
    func getAlbumFailure() {
        view?.hideHUD()
        print("Couldn't retrieve album by index")
    }
}
