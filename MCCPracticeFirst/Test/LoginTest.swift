//
//  LoginTest.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct LoginTest: View {
  @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
      
      let loginStatusInfo : (Bool) -> String = {isLoggedIn in
          return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
      }
      var body: some View {
          
          VStack(spacing: 20) {
              Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
              Text(kakaoAuthVM.isLoggedIn.description)
                  .padding()
              Button("카카오 로그인",action: {
                  kakaoAuthVM.handleKakakoLogin()
              })
              Button("카카오 로그아웃", action: {
                  kakaoAuthVM.kakaoLogout()
              })
          }
      }
}

struct LoginTest_Previews: PreviewProvider {
    static var previews: some View {
        LoginTest()
    }
}
