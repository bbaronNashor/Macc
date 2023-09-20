//
//  DummyData.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/19.
//

import Foundation

let dummyUser = User(name: "User", image: "User", following: [dummyBusker1,dummyBusker2,dummyBusker3,dummyBusker4,dummyBusker5],latitude: 37.557192,longitude: 126.925381)


let dummyBusker1 = Busker(id: UUID(), name: "박보영", image: "Busker1")
let dummyBusker2 = Busker(id: UUID(), name: "NewJeans", image: "Busker2")
let dummyBusker3 = Busker(id: UUID(), name: "SunMe", image: "Busker3")
let dummyBusker4 = Busker(id: UUID(), name: "AKB48", image: "Busker4")
let dummyBusker5 = Busker(id: UUID(), name: "김채원", image: "Busker5")

let dummyBuskingNow: [Busking] = [dummyBusking1,dummyBusking2,dummyBusking3,dummyBusking4,dummyBusking5]

let dummyBusking1 = Busking(id: UUID(), name: "박보영", image: "Busker1", time: "12:00 ~14:00", latitude: 37.557192, longitude: 126.925381)
let dummyBusking2 = Busking(id: UUID(), name: "NewJeans", image: "Busker2", time: "12:00 ~14:00", latitude: 37.557777, longitude: 126.925536)
let dummyBusking3 = Busking(id: UUID(), name: "SunMe", image: "Busker3", time: "12:00 ~14:00", latitude: 37.557282, longitude: 126.926091)
let dummyBusking4 = Busking(id: UUID(), name: "AKB48", image: "Busker4", time: "12:00 ~14:00", latitude: 37.557892, longitude: 126.924338)
let dummyBusking5 = Busking(id: UUID(), name: "김채원", image: "Busker5", time: "12:00 ~14:00", latitude: 36.054547008708475, longitude: 129.3770062292809)

