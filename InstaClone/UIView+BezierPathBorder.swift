//
//  UIView+BezierPathBorder.swift
//  InstaClone
//
//  Created by muxammed on 24.10.2022.
//

import UIKit

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)

        // This makes it left to right, default is top to bottom
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}

extension UIView {

    func makeGradient(from: UIColor, to: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [from.cgColor, to.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.addSublayer(gradient)
    }
    
    fileprivate struct Constants {
        
        static let externalBorderName = "externalBorder"
    }

    func addExternalBorder(borderWidth: CGFloat = 2.0, borderColor: UIColor = .white) -> CALayer {
        let externalBorder = CALayer()
        externalBorder.frame = CGRect(x: -borderWidth, y: -borderWidth,
                                      width: frame.size.width + 2 * borderWidth,
                                      height: frame.size.height + 2 * borderWidth)
        externalBorder.borderColor = borderColor.cgColor
        externalBorder.borderWidth = borderWidth
        externalBorder.name = Constants.externalBorderName

        layer.insertSublayer(externalBorder, at: 0)
        layer.masksToBounds = false

        return externalBorder
    }

    func removeExternalBorders() {
        layer.sublayers?.filter({ $0.name == Constants.externalBorderName }).forEach({
            $0.removeFromSuperlayer()
        })
    }

    func removeExternalBorder(externalBorder: CALayer) {
        guard externalBorder.name == Constants.externalBorderName else { return }
        externalBorder.removeFromSuperlayer()
    }
}
