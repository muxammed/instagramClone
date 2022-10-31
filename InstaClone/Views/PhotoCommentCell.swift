//
//  PhotoCommentCell.swift
//  InstaClone
//
//  Created by muxammed on 30.10.2022.
//

import UIKit

final class PhotoCommentCell: UITableViewCell {
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var commentedPhoto: UIImageView!
    @IBOutlet weak var commentTextLabel: UILabel!
    
    static let identifier = "PhotoCommentCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(with action: Action) {
        userPhoto.image = UIImage(named: action.actionUser.userImage)
        commentedPhoto.image = UIImage(named: action.actionPhoto)
        // commentTextLabel.text = "\(action.actionUser.userName) \(action.actionText)"
        commentTextLabel.attributedText = createAttributedString(action)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
