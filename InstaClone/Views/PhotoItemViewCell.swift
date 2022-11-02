//
//  PhotoItemViewCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit
/// PhotoItemViewCell ячейка для отображения коллекций фотографий каждому табу
final class PhotoItemViewCell: UICollectionViewCell {
    
    // MARK: - Visual components
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoImageViewCell.self, forCellWithReuseIdentifier: PhotoImageViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Public properties
    static let identifier = "PhotoItemViewCell"
    
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
    public func configure(photos: [String]) {
        self.addSubview(photosCollectionView)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        photosCollectionView.contentSize = CGSize(width: photosCollectionView.frame.width, height: 100)
        self.photos = photos
        self.photosCollectionView.reloadData()
    }
}

/// UICollectionViewDelegate, UICollectionViewDataSource
extension PhotoItemViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoImageViewCell.identifier,
                                                         for: indexPath) as? PhotoImageViewCell {
            cell.configure(photo: photos?[indexPath.item] ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
}

/// UICollectionViewDelegateFlowLayout
extension PhotoItemViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width - 4) / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
