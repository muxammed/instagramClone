//
//  MainDetailsViewCell.swift
//  InstaClone
//
//  Created by muxammed on 31.10.2022.
//

import UIKit
/// MainDetailsViewCell - верхняя ячейка таблицы с основными данными аккаунта
final class MainDetailsViewCell: UITableViewCell {
    @IBOutlet weak var informationStackView: UIStackView!
    @IBOutlet weak var userImageBorder: BorderedImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    // MARK: - Public properties
    static let identifier = "MainDetailsViewCell"
    
    // MARK: - Public methods
    public static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureMainCell(with details: UserDetail) {
        userImage.image = UIImage(named: details.user.userImage)
        let startColor = UIColor(named: Constants.borderImageViewBackColor) ?? UIColor.red
        userImageBorder.gradientColors = [startColor, .purple]
        
        for subview in informationStackView.subviews {
            subview.removeFromSuperview()
        }
        
        for infos in details.mainInfoCounts {
            let infoView = InformationView()
            infoView.configure(with: (infos.infoCount, infos.infoName))
            informationStackView.addArrangedSubview(infoView)
        }
    }
}
