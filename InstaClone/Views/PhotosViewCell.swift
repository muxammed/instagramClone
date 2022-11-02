//
//  PhotosViewCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit
/// PhotosViewCell - ячеяка таблицы для показа коллекций с фотографиями
final class PhotosViewCell: UITableViewCell {
    
    // MARK: - Visual components
    @IBOutlet weak var tabsCollectionView: UICollectionView!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var indicatorLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var indicatorWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var photosCollectionHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Public properties
    static let identifier = "PhotosViewCell"
    
    // MARK: - Private properties
    private var accountDetail: UserDetail?
    private let tabItemsImagesArray = ["grid", "igtv", "tags"]
    
    // MARK: - Public methods
    static func nib() -> UINib {
        return UINib(nibName: PhotosViewCell.identifier, bundle: nil)
    }
    
    public func configure(with accountDetail: UserDetail) {
        self.accountDetail = accountDetail
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(PhotoItemViewCell.self, forCellWithReuseIdentifier: PhotoItemViewCell.identifier)
        photosCollectionView.reloadData()
        
        tabsCollectionView.delegate = self
        tabsCollectionView.dataSource = self
        tabsCollectionView.register(TabItemViewCell.self, forCellWithReuseIdentifier: TabItemViewCell.identifier)
        tabsCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true,
                                      scrollPosition: .centeredHorizontally)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = (self.frame.width - 5) / 3
        indicatorWidthConstraint.constant = width
        self.layoutIfNeeded()
    }
}

/// UICollectionViewDelegate, UICollectionViewDataSource
extension PhotosViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabsCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabItemViewCell.identifier,
                                                             for: indexPath) as? TabItemViewCell {
                cell.configure(imageName: tabItemsImagesArray[indexPath.item])
                return cell
            }
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoItemViewCell.identifier,
                                                         for: indexPath) as? PhotoItemViewCell {
            let photos = accountDetail?.photos[indexPath.item].photos ?? []
            cell.configure(photos: photos)
            cell.layoutIfNeeded()
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabsCollectionView {
            let width = (UIScreen.main.bounds.size.width - 4) / 3
            indicatorLeadingConstraint.constant = (width * CGFloat(indexPath.item)) + 2
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self = self else { return }
                self.layoutIfNeeded()
            }
            let itemWidth = (photosCollectionView.frame.width / 3)
            let itemsCount = accountDetail?.photos[indexPath.item].photos.count ?? 0
            let cellHeight = itemWidth * CGFloat(itemsCount)
            DispatchQueue.main.async {
                self.photosCollectionHeightConstraint.constant = cellHeight
                self.updateConstraints()
                self.layoutIfNeeded()
            }
            
        }
    }
}

/// UICollectionViewDelegateFlowLayout
extension PhotosViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tabsCollectionView {
            let width = (UIScreen.main.bounds.size.width - 5) / 3
            return CGSize(width: width, height: 40)
        }
        let itemWidth = (UIScreen.main.bounds.size.width / 3)
        let itemsCount = accountDetail?.photos[indexPath.item].photos.count ?? 0
        let cellHeight = itemWidth * CGFloat(itemsCount)
        return CGSize(width: frame.width, height: cellHeight)
    }
}
