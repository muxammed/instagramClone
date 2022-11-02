//
//  ActualsViewCell.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//

import UIKit

/// ActualsViewCell ячейка с горизонтальным коллекцией для вывода актуальных постов в виде округленных картинок
final class ActualsViewCell: UITableViewCell {
    
    // MARK: - Visual components
    @IBOutlet weak var actualsColletionView: UICollectionView!
    
    // MARK: - Public properties
    static let identifier = "ActualsViewCell"
    
    // MARK: - Private properties
    private var actuals: [Actual]?
    // MARK: - Public methods
    public static func nib() -> UINib {
        return UINib(nibName: ActualsViewCell.identifier, bundle: nil)
    }
    
    public func configure(with actuals: [Actual]) {
        self.actuals = actuals
        actualsColletionView.delegate = self
        actualsColletionView.dataSource = self
        actualsColletionView.register(ActualViewCell.nib(), forCellWithReuseIdentifier: ActualViewCell.identifier)
        actualsColletionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

/// UICollectionViewDelegate, UICollectionViewDataSource
extension ActualsViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actuals?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActualViewCell.identifier,
                                                         for: indexPath) as? ActualViewCell {
            guard let actuals = actuals else { return UICollectionViewCell()}
            cell.configure(with: actuals[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}

/// UICollectionViewDelegateFlowLayout
extension ActualsViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 20 - (10 * 3)) / 4.8, height: 90)
    }
}
