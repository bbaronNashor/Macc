//
//  LogInButtonComponent.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct LogInButton: View {
    
    var LogoName: String = "KakaoLogo"
    var ButtonText: String = "Kakao로 로그인하기"
    
    var body: some View {
        HStack {
            Image(LogoName)
                .resizable()
                .scaledToFit()
                .frame(width: 46)
                .padding(.horizontal)
            Spacer()
            Text(ButtonText)
                .fontWeight(.black)
                .foregroundColor(.white)
                .font(.callout)
            Spacer()
            Spacer()
        }
        .padding(.vertical, 8)
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}


struct LogInButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInButton()
    }
}
