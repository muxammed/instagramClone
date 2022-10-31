//
//  RecommendsTableViewCell.swift
//  InstaClone
//
//  Created by muxammed on 24.10.2022.
//

import UIKit
/// RecommendsTableViewCell ячейка для показа рекомендаций
final class RecommendsTableViewCell: UITableViewCell {

    @IBOutlet weak var recommendsScrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    static let identifier = "RecommendsTableViewCell"
    var recommends: [Lenta] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "RecommendsTableViewCell", bundle: nil)
    }
    
    public func configure(with recommends: [Lenta]) {
        self.recommends = recommends
        configureItems()
    }
    
    func configureItems() {
        
        recommendsScrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        
        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        for index in 0..<recommends.count {
            let item = RecommendView(frame: .zero)
            item.translatesAutoresizingMaskIntoConstraints = false
            let lenta = recommends[index]
            item.userName.text = lenta.userName
            item.userImageView.image = UIImage(named: lenta.userImage)
            let itemWidth = CGFloat(UIScreen.main.bounds.width / 1.8)
            
            NSLayoutConstraint.activate([
                item.widthAnchor.constraint(equalToConstant: itemWidth),
                item.heightAnchor.constraint(equalTo: item.widthAnchor, multiplier: 1.2),
            ])
            item.needsUpdateConstraints()
            
            stackView.addArrangedSubview(item)
            
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
