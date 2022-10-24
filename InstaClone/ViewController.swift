//
//  ViewController.swift
//  InstaClone
//
//  Created by muxammed on 19.10.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {

    @IBOutlet weak var mainTabTableView: UITableView!
    
    var recomends = ["rec1", "rec2", "rec3", "rec4", "rec5"]
    
    var lentas = [Lenta(userName: "Ваша история", userImage: "user1"),
                  Lenta(userName: "sivak1554", userImage: "user2"),
                  Lenta(userName: "spinova_20.05", userImage: "user3"),
                  Lenta(userName: "selivanov_sergey", userImage: "user4"),
                  Lenta(userName: "serkra", userImage: "user5"),
                  Lenta(userName: "yesho_kto", userImage: "user6"),
                  Lenta(userName: "dragon", userImage: "user7"),
                  Lenta(userName: "hitman89", userImage: "user8")]
    var posts: [Post] = []
    var recommends: [Lenta] = []
    
    private func loadPosts() {
        var post = Post(postName: "cardinalartur", postImage: "post2",
             postDescription: "С прошедшим юбилеем, Анна Феодоровна",
             postEmofji: "❤️ " + " 🙌", postTimeAgo: 4, postLikes: 191,
             postUser: lentas[1])
        posts.append(post)
        
        post = Post(postName: "lameri", postImage: "post1",
             postDescription: "Еще один пост низнаю про что но что то",
             postEmofji: "🙌", postTimeAgo: 10, postLikes: 200,
             postUser: self.lentas[2])
        posts.append(post)

        post = Post(postName: "yesho_kto_to", postImage: "post3",
             postDescription: "Еще кто то пост оставил 12 минут назад",
             postEmofji: "👍", postTimeAgo: 12, postLikes: 60 ,
             postUser: self.lentas[3])
        posts.append(post)
        
        recommends = lentas.reversed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPosts()
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        
        mainTabTableView.rowHeight = UITableView.automaticDimension
        mainTabTableView.estimatedRowHeight = 100
        mainTabTableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        mainTabTableView.register(LentaTableViewCell.nib(), forCellReuseIdentifier: LentaTableViewCell.identifier)
        mainTabTableView.register(RecommendsTableViewCell.nib(),
                                  forCellReuseIdentifier: RecommendsTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("ROW \(indexPath.row)")
        
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: LentaTableViewCell.identifier,
                                                        for: indexPath) as? LentaTableViewCell {
                cell.configure(with: lentas)
                return cell
            }
        } else if indexPath.row % 3 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: RecommendsTableViewCell.identifier,
                                                        for: indexPath) as? RecommendsTableViewCell {
                cell.configure(with: recommends)
                return cell
            }
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier,
                                                    for: indexPath) as? PostTableViewCell {
            if indexPath.row > 3 {
                cell.configure(with: posts[indexPath.row - 2], user: lentas[0])
            } else {
                cell.configure(with: posts[indexPath.row - 1], user: lentas[0])
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let lenta = lentas.count == 0 ? 0 : 1
        return posts.count + lenta + 1
    }
}
