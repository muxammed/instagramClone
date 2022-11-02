//
//  PhotoImageViewCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit
/// PhotoImageViewCell ячейка для показа фотографии в коллекции
final class PhotoImageViewCell: UICollectionViewCell {
    // MARK: - Visual components
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "post3")
        return imageView
    }()
    
    // MARK: - Public properties
    static let identifier = "PhotoImageViewCell"
    
    // MARK: - Private properties
    private var photos: [String]?
    
    // MARK: - Initialisators
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    public func configure(photo: String) {
        self.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        self.photoImageView.image = UIImage(named: photo)
    }
}
