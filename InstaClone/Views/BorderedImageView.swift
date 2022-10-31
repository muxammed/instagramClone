//
//  BorderedImageView.swift
//  InstaClone
//
//  Created by muxammed on 24.10.2022.
//

import UIKit

/// BorderedImageView - кастомный вьюв для создания бордера для любой вьюв переопределяется layoutSubviews
final class BorderedImageView: UIView {
    // MARK: - Public properties
    var gradientColors: [UIColor] = [.systemGreen, .systemMint] {
        didSet {
            setNeedsLayout()
        }
    }
    
    // MARK: - Public methods
    override func layoutSubviews() {
        super.layoutSubviews()

        let gradient = UIImage.gradientImage(bounds: bounds, colors: gradientColors)
        layer.borderColor = UIColor(patternImage: gradient).cgColor
        layer.cornerRadius = bounds.width / 2
    }
}
