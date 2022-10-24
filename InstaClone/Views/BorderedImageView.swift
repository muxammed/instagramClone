//
//  BorderedImageView.swift
//  InstaClone
//
//  Created by muxammed on 24.10.2022.
//

import UIKit

final class BorderedImageView: UIView {
    var gradientColors: [UIColor] = [.systemGreen, .systemMint] {
        didSet {
            setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let gradient = UIImage.gradientImage(bounds: bounds, colors: gradientColors)
        layer.borderColor = UIColor(patternImage: gradient).cgColor
        layer.cornerRadius = bounds.width / 2
    }
}
