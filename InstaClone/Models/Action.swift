//
//  Action.swift
//  InstaClone
//
//  Created by muxammed on 31.10.2022.
//

/// ActionType тип ячейки действие что бы определять действие подписание или информационное
enum ActionType {
    case photoComment
    case followAction
}
/// Action модель для действия
struct Action {
    let actionText: String
    let actionUser: Lenta
    let actionPhoto: String
    let hasAnswer: Bool
    let actionType: ActionType
    let actionFollowed: Bool
    let timesAgo: String
}
