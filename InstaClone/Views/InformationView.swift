//
//  InformationView.swift
//  InstaClone
//
//  Created by muxammed on 31.10.2022.
//

import UIKit
/// InformationView кастомный класс что бы переиспользовать при показе однородной информации подписки, публикации и тд.
final class InformationView: UIView {
    // MARK: - Visual components
    let infoCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let infoNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Public properties
    static let identifier = "InformationView"
    
    // MARK: - Initialisators
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    public func configure(with values: (String, String)) {
        infoCountLabel.text = values.0
        infoNameLabel.text = values.1
        infoCountLabel.textColor = values.0 == "0" ? UIColor.gray : UIColor.white
    }
    
    // MARK: - Private methods
    private func setupViews() {
        addSubview(infoCountLabel)
        addSubview(infoNameLabel)
        
        infoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        infoCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            infoCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoNameLabel.topAnchor.constraint(equalTo: infoCountLabel.bottomAnchor),
            infoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
