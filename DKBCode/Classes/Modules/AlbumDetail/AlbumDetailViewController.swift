//
//  AlbumDetailViewController.swift
//  DKBCodeTask (iOS)
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.

import UIKit
import Kingfisher

class AlbumDetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        presenter?.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterAlbumDetailProtocol?
    
    lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}

extension AlbumDetailViewController: PresenterToViewAlbumDetailProtocol {

    func onGetImageSuccess(_ title: String,_ imageUrl: URL,_ placeholder: UIImage) {
        titleLabel.text = title
        albumImageView.kf.setImage(with: imageUrl, placeholder: placeholder)
    }

    func onGetImageFailure(_ title: String) {
        titleLabel.text = title
    }
}

// MARK: - UI Setup
extension AlbumDetailViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(albumImageView)
        self.view.addSubview(titleLabel)
        
        let widthHeightConstant = self.view.frame.width * 0.9
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            albumImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            albumImageView.widthAnchor.constraint(equalToConstant: widthHeightConstant),
            albumImageView.heightAnchor.constraint(equalToConstant: widthHeightConstant)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
