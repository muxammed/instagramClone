//
//  RecommendView.swift
//  InstaClone
//
//  Created by muxammed on 24.10.2022.
//

import UIKit

final class RecommendView: UIView {
    
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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подписаться", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemIndigo
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(closeIcon)
        addSubview(userImageView)
        addSubview(userName)
        addSubview(subscribeButton)
        
        layer.cornerRadius = 10
        backgroundColor = .black
        NSLayoutConstraint.activate([
            
            closeIcon.widthAnchor.constraint(equalToConstant: 30),
            closeIcon.heightAnchor.constraint(equalToConstant: 30),
            closeIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            closeIcon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            userImageView.widthAnchor.constraint(equalToConstant: 100),
            userImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
