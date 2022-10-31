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
    let closeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .white
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightText
        label.textAlignment = .center
        return label
    }()
    
    let subscribeButton: UIButton = {
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
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    // MARK: - Private methods
    private func setupView() {
        addSubview(closeIcon)
        addSubview(userImageView)
        addSubview(userName)
        addSubview(subscribeButton)
        
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        backgroundColor = .black
        NSLayoutConstraint.activate([
            
            closeIcon.widthAnchor.constraint(equalToConstant: 20),
            closeIcon.heightAnchor.constraint(equalToConstant: 20),
            closeIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            closeIcon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            userImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor, constant: 0),
            
            userName.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            subscribeButton.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8),
            subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            subscribeButton.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
