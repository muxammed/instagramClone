//
//  LentaItem.swift
//  InstaClone
//
//  Created by muxammed on 22.10.2022.
//

import UIKit
/// LentaItem кастомный вьюв для показа элемента ленты
final class LentaItem: UIView {
    
    // MARK: - Visual components
    let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let plusView: BorderedImageView = {
        let view = BorderedImageView()
        view.backgroundColor = UIColor(red: 51/255, green: 150/255, blue: 254/255, alpha: 1)
        view.gradientColors = [.black, .black]
        view.layer.borderWidth = 2.5
        view.isHidden = true
        return view
    }()
    let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plus")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    let circleView: BorderedImageView = {
        let view = BorderedImageView()
        view.gradientColors = [UIColor(red: 202/255, green: 146 / 255, blue: 82/255, alpha: 1.0), .purple]
        view.layer.borderWidth = 2.5
        return view
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        userImage.layer.cornerRadius = (frame.width - 24) / 2
        plusView.layer.cornerRadius = plusView.frame.width / 2
    }
    
    // MARK: - Initialisators
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        addSubview(circleView)
        circleView.addSubview(userImage)
        addSubview(userName)
        addSubview(plusView)
        plusView.addSubview(plusImageView)
        setupLayout()
    }
    
    private func setupLayout() {
        
        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        circleView.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            circleView.widthAnchor.constraint(equalTo: widthAnchor, constant: -12),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userImage.widthAnchor.constraint(equalTo: circleView.widthAnchor, constant: -10),
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor),
            userImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            userImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            
            plusView.centerYAnchor.constraint(equalTo: userImage.bottomAnchor, constant: -5),
            plusView.centerXAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -7),
            plusView.widthAnchor.constraint(equalToConstant: 24),
            plusView.heightAnchor.constraint(equalToConstant: 24),
            
            plusImageView.centerXAnchor.constraint(equalTo: plusView.centerXAnchor),
            plusImageView.centerYAnchor.constraint(equalTo: plusView.centerYAnchor),
            plusImageView.widthAnchor.constraint(equalToConstant: 11),
            plusImageView.heightAnchor.constraint(equalToConstant: 11)
        ])
        layoutSubviews()
    }
}
