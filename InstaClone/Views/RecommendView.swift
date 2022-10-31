//
//  RecommendView.swift
//  InstaClone
//
//  Created by muxammed on 24.10.2022.
//

import UIKit
/// RecommendView - ячейка для показа рекомендаций
final class RecommendView: UIView {
    
    // MARK: - Visual components
    private let closeIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .white
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightText
        label.textAlignment = .center
        return label
    }()
    
    private let subscribeButton: UIButton = {
        let button = UIButton()
        let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        button.setAttributedTitle(NSAttributedString(string: "Подписаться", attributes: attrs), for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemIndigo
        return button
    }()
    
    // MARK: - Initialisators
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCorners()
    }
    
    public func configure(with data: Lenta) {
        userNameLabel.text = data.userName
        userImageView.image = UIImage(named: data.userImage)
    }
    
    // MARK: - Private methods
    private func setupCorners() {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    private func configCloseIcon() {
        addSubview(closeIconImageView)
        closeIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            closeIconImageView.widthAnchor.constraint(equalToConstant: 20),
            closeIconImageView.heightAnchor.constraint(equalToConstant: 20),
            closeIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            closeIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        ])
    }
    
    private func setupUserImageView() {
        addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            userImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor, constant: 0),
            
        ])
    }
    
    private func setupUserName() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
    
    private func setupSubscribeButton() {
        addSubview(subscribeButton)
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subscribeButton.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            subscribeButton.heightAnchor.constraint(equalToConstant: 33)
            
        ])
    }
    
    private func setupView() {
        configCloseIcon()
        setupUserImageView()
        setupUserName()
        setupSubscribeButton()
        layer.cornerRadius = 10
        backgroundColor = .black
    }
}
