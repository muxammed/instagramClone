//
//  ActualCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit
/// ActualCell ячейка коллекции для актульных
final class ActualViewCell: UICollectionViewCell {
    
    // MARK: - Visual components
    @IBOutlet weak var actualImageView: UIImageView!
    @IBOutlet weak var actualNameLabel: UILabel!
    
    // MARK: - Public properties
    public static let identifier = "ActualViewCell"
    
    // MARK: - Public methods
    public static func nib() -> UINib {
        return UINib(nibName: ActualViewCell.identifier, bundle: nil)
    }
    
    public func configure(with actual: Actual) {
        actualImageView.image = UIImage(named: actual.actualImageName)
        actualImageView.layer.borderColor = UIColor.darkGray.cgColor
        actualImageView.layer.borderWidth = 1.5
        actualNameLabel.text = actual.actualTitle
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        actualImageView.layer.cornerRadius = actualImageView.frame.width / 2
    }
}
