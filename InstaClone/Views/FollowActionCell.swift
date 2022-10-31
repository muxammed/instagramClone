//
//  FollowActionCell.swift
//  InstaClone
//
//  Created by muxammed on 31.10.2022.
//

import UIKit
/// FollowActionCell - ячейка таблицы действии для отображения подписания и подписанных
final class FollowActionCell: UITableViewCell {
    
    // MARK: - Visual components
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var actionText: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    // MARK: - Public properties
    static let identifier = "FollowActionCell"
    
    // MARK: - Public methods
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with action: Action) {
        userImage.image = UIImage(named: action.actionUser.userImage)
        
        actionText.attributedText = createAttributedString(action)
        
        var followedButtonConfiguration = action.actionFollowed
        ? UIButton.Configuration.plain()
        : UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        let buttonTitle = action.actionFollowed ? "Вы подписаны" : "Подписаться"
        followedButtonConfiguration.attributedTitle = AttributedString(buttonTitle, attributes: container)
        followButton.clipsToBounds = true
        followButton.layer.borderColor = action.actionFollowed ? UIColor.darkGray.cgColor : UIColor.systemBlue.cgColor
        followButton.backgroundColor = .clear
        followButton.layer.borderWidth = 1.5
        followButton.layer.cornerRadius = 5
        
        followButton.configuration = followedButtonConfiguration
    }
    
    private func createAttributedString(_ action: Action) -> NSMutableAttributedString {
        let unameAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold),
                         NSAttributedString.Key.foregroundColor: UIColor.white]
        let commentAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular),
                         NSAttributedString.Key.foregroundColor: UIColor.white]
        let timesAgoAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular),
                            NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(NSAttributedString(string: action.actionUser.userName, attributes: unameAttr))
        mutableAttributedString.append(NSAttributedString(string: " ", attributes: unameAttr))
        mutableAttributedString.append(NSAttributedString(string: action.actionText, attributes: commentAttr))
        mutableAttributedString.append(NSAttributedString(string: " ", attributes: unameAttr))
        mutableAttributedString.append(NSAttributedString(string: action.timesAgo, attributes: timesAgoAttr))
        return mutableAttributedString
    }
}
