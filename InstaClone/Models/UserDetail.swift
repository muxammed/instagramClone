//
//  UserDetail.swift
//  InstaClone
//
//  Created by muxammed on 01.11.2022.
//
/// UserDetail
struct UserDetail {
    let user: Lenta
    var mainInfoCounts: [InfoCount]
    var title: String
    var jobTitle: String
    var ceo: String
    var webSite: String
    var follower: String
    var actuals: [Actual]
    var photos: [AccauntPhotos]
}
/// InfoCount
struct InfoCount {
    let infoName: String
    let infoCount: String
}

// Actual
struct Actual {
    let actualTitle: String
    let actualImageName: String
}

// AccauntPhotos
struct AccauntPhotos {
    let tabName: String
    let photos: [String]
}
