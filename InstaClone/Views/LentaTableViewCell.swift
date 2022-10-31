//
//  LentaTableViewCell.swift
//  InstaClone
//
//  Created by muxammed on 22.10.2022.
//

import UIKit

/// LentaTableViewCell - кастомная ячейка для ленты
final class LentaTableViewCell: UITableViewCell {

    // MARK: - Visual components
    @IBOutlet weak var lentaScrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Public properties
    private var lentas: [Lenta] = []
    static let identifier = "LentaTableViewCell"
    
    // MARK: - Public methods
    static func nib() -> UINib {
        return UINib(nibName: "LentaTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with lentas: [Lenta]) {
        self.lentas = lentas
        configureItems()
    }
    
    func configureItems() {
        
        for subview in stackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        for index in 0..<lentas.count {
            let item = LentaItem(frame: .zero)
            item.translatesAutoresizingMaskIntoConstraints = false
            let lenta = lentas[index]
            item.userName.text = lenta.userName
            item.userImage.image = UIImage(named: lenta.userImage)
            let itemWidth = CGFloat(UIScreen.main.bounds.width / 4.6)
            if index == 0 {
                item.userName.font = UIFont.systemFont(ofSize: item.userName.font.pointSize, weight: .regular)
                item.plusView.isHidden = false
                item.circleView.gradientColors = [.clear, .clear]
            }
            
            NSLayoutConstraint.activate([
                item.widthAnchor.constraint(equalToConstant: itemWidth),
                item.heightAnchor.constraint(equalTo: item.widthAnchor, multiplier: 1.2),
            ])
            item.needsUpdateConstraints()
            
            stackView.addArrangedSubview(item)
            
        }
    }
}
