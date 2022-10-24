//
//  Post.swift
//  InstaClone
//
//  Created by muxammed on 22.10.2022.
//

import UIKit
/// структура Поста
struct Post {
    let postName: String
    let postImage: String
    let postDescription: String
    let postEmofji: String
    let postTimeAgo: Int
    let postLikes: Int
    let postUser: Lenta
}
/// структура Рекомендации
struct Recommend {
    let recommendImage: UIImage
}
