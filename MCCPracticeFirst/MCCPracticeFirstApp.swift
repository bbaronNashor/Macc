//
//  MCCPracticeFirstApp.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

@main
struct MCCPracticeFirstApp: App {
    
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            LoginTest()
        }
    }
}
