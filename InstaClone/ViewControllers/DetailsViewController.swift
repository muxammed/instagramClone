//
//  DetailsViewController.swift
//  InstaClone
//
//  Created by muxammed on 31.10.2022.
//

import UIKit

/// DetailsViewController - экран детализации аккаунта
final class DetailsViewController: UIViewController {
    
    // MARK: - Visual components
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Private properties
    private let refreshController = UIRefreshControl()
    private var hasRefreshed = false
    private var userDetail: UserDetail?
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addRefreshController()
    }
    
    // MARK: - Public methods
    @objc func refreshAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.mainTableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .fade)
            self.refreshController.endRefreshing()
        }
    }
    
    // MARK: - Private methods
    private func configure() {
        navigationItem.title = Constants.currentUserName
        let user = Lenta(userName: "serkra", userImage: "user2")
        userDetail = UserDetail(user: user,
                                mainInfoCounts: [],
                                title: "Илон Маск в России",
                                jobTitle: "Предприниматель",
                                ceo: "CEO @spacex / @teslamotors / сооснователь @paypal",
                                webSite: "www.spacex.com",
                                follower: "подписаны: dima_baranovskiy",
                                actuals: [
                                    Actual(actualTitle: "Starlink", actualImageName: "starlink3"),
                                    Actual(actualTitle: "Tesle", actualImageName: "tesla"),
                                    Actual(actualTitle: "Starship", actualImageName: "starlink3"),
                                    Actual(actualTitle: "SpaceX", actualImageName: "tesla"),
                                    Actual(actualTitle: "Crew Dragon", actualImageName: "starlink3"),
                                    Actual(actualTitle: "Starlink", actualImageName: "tesla"),
                                    Actual(actualTitle: "Tesle", actualImageName: "starlink3"),
                                    Actual(actualTitle: "Starship", actualImageName: "tesla"),
                                    Actual(actualTitle: "SpaceX", actualImageName: "starlink3"),
                                    Actual(actualTitle: "Crew Dragon", actualImageName: "tesla"),
                                ],
                                photos: [
                                    AccauntPhotos(tabName: "firstTab", photos: ["post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3"]),
                                    AccauntPhotos(tabName: "secondTab", photos: ["post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3"]),
                                    AccauntPhotos(tabName: "thirdTab", photos: ["post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3",
                                                                                "post3", "post3", "post3", "post3"])
                                ])
        userDetail?.mainInfoCounts.append(InfoCount(infoName: "Публикации", infoCount: "152"))
        userDetail?.mainInfoCounts.append(InfoCount(infoName: "Подписчики", infoCount: "18,6 тыс."))
        userDetail?.mainInfoCounts.append(InfoCount(infoName: "Подписки", infoCount: "0"))
        
        mainTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 70
        
        mainTableView.register(MainDetailsViewCell.nib(), forCellReuseIdentifier: MainDetailsViewCell.identifier)
        mainTableView.register(TextInfoViewCell.nib(), forCellReuseIdentifier: TextInfoViewCell.identifier)
        mainTableView.register(ActualsViewCell.nib(), forCellReuseIdentifier: ActualsViewCell.identifier)
        mainTableView.register(PhotosViewCell.nib(), forCellReuseIdentifier: PhotosViewCell.identifier)
    }
    
    private func addRefreshController() {
        refreshController.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        mainTableView.addSubview(refreshController)
    }
}

/// UITableViewDelegate, UITableViewDataSource
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.item {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MainDetailsViewCell.identifier,
                                                        for: indexPath) as? MainDetailsViewCell {
                guard let userDetail = userDetail else { return UITableViewCell()}
                cell.configureMainCell(with: userDetail)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextInfoViewCell.identifier,
                                                        for: indexPath) as? TextInfoViewCell {
                guard let userDetail = userDetail else { return UITableViewCell()}
                cell.configure(with: userDetail)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ActualsViewCell.identifier,
                                                        for: indexPath) as? ActualsViewCell {
                guard let userDetail = userDetail else { return UITableViewCell()}
                cell.configure(with: userDetail.actuals)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PhotosViewCell.identifier,
                                                        for: indexPath) as? PhotosViewCell {
                guard let userDetail = userDetail else { return UITableViewCell()}
                cell.configure(with: userDetail)
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
