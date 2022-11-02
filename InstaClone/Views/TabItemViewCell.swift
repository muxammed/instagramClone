//
//  TabItemViewCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit
/// TabItemViewCell якейка для таба
final class TabItemViewCell: UICollectionViewCell {
    // MARK: - Visual components
    private let tabImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    // MARK: - Public properties
    static let identifier = "TabItemViewCell"
    
    // MARK: - Initialisators
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    public func configure(imageName: String) {
        tabImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
    }
    
    override var isSelected: Bool {
        didSet {
            tabImageView.tintColor = isSelected ? .white : .darkGray
        }
    }
    
    // MARK: - Private methods
    private func setupViews() {
        addSubview(tabImageView)
        tabImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabImageView.widthAnchor.constraint(equalToConstant: 20),
            tabImageView.heightAnchor.constraint(equalToConstant: 20),
            tabImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tabImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
