//
//  ActionsViewController.swift
//  InstaClone
//
//  Created by muxammed on 30.10.2022.
//

import UIKit
/// ActionsViewController - таббед экран действий табл вьюв с двумя типами ячейек
final class ActionsViewController: UIViewController {
    
    // MARK: - Visual components
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private properties
    private var clearItems = false
    private var lentas = [Lenta(userName: "Ваша история", userImage: "user1"),
                  Lenta(userName: "sivak1554", userImage: "user2"),
                  Lenta(userName: "spinova_20.05", userImage: "user3"),
                  Lenta(userName: "selivanov_sergey", userImage: "user4"),
                  Lenta(userName: "serkra", userImage: "user5"),
                  Lenta(userName: "yesho_kto", userImage: "user6"),
                  Lenta(userName: "dragon", userImage: "user7"),
                  Lenta(userName: "hitman89", userImage: "user8")]
    private var sections = ["Сегодня", "На этой неделе"]
    private lazy var actions = [
        [
            Action(actionText: "упомянул(-а) вас в комментарии: @evgeny_zverik спасибо)",
                actionUser: lentas[1],
                actionPhoto: lentas[0].userImage,
                hasAnswer: true,
                actionType: .photoComment,
                   actionFollowed: false,
                   timesAgo: "12ч."),
            Action(actionText: "понравился ваш комментарий \"ух ты ты фотошопер какой\" понравил ваш комментарий"
                   + " очень длинный текст для проверки авторесайз"
                   + " очень длинный текст для проверки авторесайз"
                   + " очень длинный текст для проверки авторесайз",
                actionUser: lentas[1],
                actionPhoto: lentas[1].userImage,
                hasAnswer: false,
                actionType: .photoComment,
                   actionFollowed: false,
                   timesAgo: "12ч.")
        ], [
            Action(actionText: "понравился ваш комментарий: \"красивые кадры\"",
                   actionUser: lentas[2],
                   actionPhoto: lentas[2].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "2д."),
            Action(actionText: "есть в Instagram. Вы можете знать этого человека.",
                   actionUser: lentas[3],
                   actionPhoto: lentas[3].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "нравится ваше видео.",
                   actionUser: lentas[4],
                   actionPhoto: lentas[4].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "подписался(-ась) на ваши обновления.",
                   actionUser: lentas[5],
                   actionPhoto: lentas[5].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: true, timesAgo: "3д."),
            Action(actionText: "понравился ваш комментарий: \"красивые кадры\"",
                   actionUser: lentas[2],
                   actionPhoto: lentas[2].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "2д."),
            Action(actionText: "есть в Instagram. Вы можете знать этого человека.",
                   actionUser: lentas[3],
                   actionPhoto: lentas[3].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "нравится ваше видео.",
                   actionUser: lentas[4],
                   actionPhoto: lentas[4].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "подписался(-ась) на ваши обновления.",
                   actionUser: lentas[5],
                   actionPhoto: lentas[5].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: true, timesAgo: "3д."),
            Action(actionText: "понравился ваш комментарий: \"красивые кадры\"",
                   actionUser: lentas[2],
                   actionPhoto: lentas[2].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "2д."),
            Action(actionText: "есть в Instagram. Вы можете знать этого человека.",
                   actionUser: lentas[3],
                   actionPhoto: lentas[3].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "нравится ваше видео.",
                   actionUser: lentas[4],
                   actionPhoto: lentas[4].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "подписался(-ась) на ваши обновления.",
                   actionUser: lentas[5],
                   actionPhoto: lentas[5].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: true, timesAgo: "3д."),
            Action(actionText: "понравился ваш комментарий: \"красивые кадры\"",
                   actionUser: lentas[2],
                   actionPhoto: lentas[2].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "2д."),
            Action(actionText: "есть в Instagram. Вы можете знать этого человека.",
                   actionUser: lentas[3],
                   actionPhoto: lentas[3].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "нравится ваше видео.",
                   actionUser: lentas[4],
                   actionPhoto: lentas[4].userImage,
                   hasAnswer: false,
                   actionType: .photoComment,
                   actionFollowed: false, timesAgo: "3д."),
            Action(actionText: "подписался(-ась) на ваши обновления.",
                   actionUser: lentas[5],
                   actionPhoto: lentas[5].userImage,
                   hasAnswer: false,
                   actionType: .followAction,
                   actionFollowed: true, timesAgo: "3д."),
        ]
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Public methods
    @objc func refresh(_ sender: AnyObject) {
        clearItems = true
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            self.clearItems = false
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Private methods
    private func configureTableView() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.register(PhotoCommentCell.nib(), forCellReuseIdentifier: PhotoCommentCell.identifier)
        tableView.register(FollowActionCell.nib(), forCellReuseIdentifier: FollowActionCell.identifier)
        tableView.estimatedRowHeight = 100

    }
}

// UITableViewDelegate, UITableViewDataSource
extension ActionsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clearItems == true ? 0 : actions[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCommentCell.identifier,
                                                        for: indexPath) as? PhotoCommentCell {
                cell.configure(with: actions[indexPath.section][indexPath.item])
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FollowActionCell.identifier,
                                                        for: indexPath) as? FollowActionCell {
                cell.configure(with: actions[indexPath.section][indexPath.item])
                
                return cell
            }
             return UITableViewCell()
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .black
        let label = UILabel()
        label.text = sections[section]
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        return view
    }
}
