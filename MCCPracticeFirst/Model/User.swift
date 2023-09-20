//
//  User.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/19.
//

import Foundation
import MapKit

struct User: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let following: [Busker]
}
