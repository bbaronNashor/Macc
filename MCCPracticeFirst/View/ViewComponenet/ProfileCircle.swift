//
//  BuskerProfileCircle.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct ProfileCircle: View {
    var image: String = ""
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .padding(5)
            .shadow(color: .white,radius: 2)
        
    }
}

struct BuskerProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircle()
    }
}
