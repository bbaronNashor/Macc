//
//  LogInView.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct LogInView: View {
    //MARK: -1.PROPERTY
    
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()
    
    let loginStatusInfo : (Bool) -> String = {isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태"
    }
    //MARK: -2.BODY

    var body: some View {
        
        VStack(alignment: .center) {
            
            Spacer()
            
            Image("AppLogo")
                .shadow(color: .white.opacity(0.15) ,radius: 20,y: 10)
            
            Spacer()
            Text(kakaoAuthVM.isLoggedIn.description)
            Button {
                //TODO: -Google LogIn 구현하기
            } label: {
                LogInButton(LogoName: "GoogleLogo", ButtonText: "Google로 로그인하기")
                    .shadow(color: .gray.opacity(0.15) ,radius: 10,y: 10)
            }
            
            Button {
                //TODO: -Google LogIn 구현하기
            } label: {
                LogInButton(LogoName: "AppleLogo", ButtonText: "Apple로 로그인하기")
                    .shadow(color: .gray.opacity(0.15) ,radius: 10,y: 10)
            }
            
            Button {
                kakaoAuthVM.handleKakakoLogin()
            } label: {
                LogInButton(LogoName: "KakaoLogo", ButtonText: "Kakao로 로그인하기")
                    .shadow(color: .gray.opacity(0.15) ,radius: 10,y: 10)
            }
        }
        .padding()
        .padding(.bottom)
    }
}

    //MARK: -3.PREVIEW
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
