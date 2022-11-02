//
//  TextInfoViewCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit
/// TextInfoViewCell - ячейка состоящая из текстовых данных аккаунта
final class TextInfoViewCell: UITableViewCell {
    // MARK: - Visual components
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var ceoLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var dropDownButton: UIButton!
    
    // MARK: - Public properties
    static let identifier = "TextInfoViewCell"
    
    // MARK: - Public methods
    public static func nib() -> UINib {
        return UINib(nibName: TextInfoViewCell.identifier, bundle: nil)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with details: UserDetail) {
        titleLabel.text = details.title
        jobTitleLabel.text = details.jobTitle
        ceoLabel.text = details.ceo
        webSiteLabel.text = details.webSite
        followerLabel.text = details.follower
    }
    
}
