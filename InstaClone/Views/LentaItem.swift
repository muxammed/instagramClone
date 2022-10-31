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
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let plusView: BorderedImageView = {
        let view = BorderedImageView()
        view.backgroundColor = UIColor(named: Constants.plusViewBackgroundColor)
        view.gradientColors = [.black, .black]
        view.layer.borderWidth = 2.5
        view.isHidden = true
        return view
    }()
    private let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.plusImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    private let circleView: BorderedImageView = {
        let view = BorderedImageView()
        let startColor = UIColor(named: Constants.borderImageViewBackColor) ?? UIColor.red
        view.gradientColors = [startColor, .purple]
        view.layer.borderWidth = 2.5
        return view
    }()
    
    private let userNameLabel: UILabel = {
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
        userImageView.layer.cornerRadius = (frame.width - 24) / 2
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
    
    // MARK: - Public methods
    public func configure(with lenta: Lenta, withPlus: Bool) {
        userNameLabel.text = lenta.userName
        userImageView.image = UIImage(named: lenta.userImage)
        if withPlus {
            userNameLabel.font = UIFont.systemFont(ofSize: userNameLabel.font.pointSize, weight: .regular)
            plusView.isHidden = false
            circleView.gradientColors = [.clear, .clear]
        }
    }
    
    // MARK: - Private methods
    private func setupView() {
        addSubview(circleView)
        circleView.addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(plusView)
        plusView.addSubview(plusImageView)
        setupLayout()
    }
    
    private func circleViewConstraints() {
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            circleView.widthAnchor.constraint(equalTo: widthAnchor, constant: -12),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func userImageViewConstraints() {
        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(equalTo: circleView.widthAnchor, constant: -10),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
            userImageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            userImageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
        ])
    }
    
    private func userNameLabelConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
        ])
    }
    
    private func plusViewConstraints() {
        NSLayoutConstraint.activate([
            plusView.centerYAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: -5),
            plusView.centerXAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -7),
            plusView.widthAnchor.constraint(equalToConstant: 24),
            plusView.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func plusImageViewConstraints() {
        NSLayoutConstraint.activate([
            plusImageView.centerXAnchor.constraint(equalTo: plusView.centerXAnchor),
            plusImageView.centerYAnchor.constraint(equalTo: plusView.centerYAnchor),
            plusImageView.widthAnchor.constraint(equalToConstant: 11),
            plusImageView.heightAnchor.constraint(equalToConstant: 11)
        ])
    }
    
    private func setupLayout() {
        
        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        circleView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        circleViewConstraints()
        userImageViewConstraints()
        userNameLabelConstraints()
        plusViewConstraints()
        plusImageViewConstraints()
        layoutSubviews()
    }
}
