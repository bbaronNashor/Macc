//
//  Action.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import Foundation

struct Action: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: () -> Void
}
