//
//  PostTableViewCell.swift
//  InstaClone
//
//  Created by muxammed on 22.10.2022.
//

import UIKit
/// PostTableViewCell таблица для поста
final class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postUserName: UILabel!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var ownIcon: UIImageView!
    @IBOutlet weak var pastTimeLabel: UILabel!
    @IBOutlet weak var commentsEmodji: UILabel!
    @IBOutlet weak var postUserImage: UIImageView!

    static let identifier = "PostTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with post: Post, user: Lenta) {
        postImage.image = UIImage(named: post.postImage)
        postUserName.text = post.postName
        let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: postDescription.font.pointSize,
                                                                    weight: .regular),
                     NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        let attrs2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: postDescription.font.pointSize,
                                                                    weight: .bold)]
        let attrString = NSAttributedString(string: " \(post.postDescription)", attributes: attrs)
        let attrString2 = NSAttributedString(string: post.postName, attributes: attrs2)
        let combination = NSMutableAttributedString()
            
        combination.append(attrString2)
        combination.append(attrString)
        postDescription.attributedText = combination
        postLikes.text = "\(post.postLikes)"
        pastTimeLabel.text = "\(post.postTimeAgo) минут назад"
        commentsEmodji.text = post.postEmofji
        ownIcon.image = UIImage(named: user.userImage)
        postUserImage.image = UIImage(named: post.postUser.userImage)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
