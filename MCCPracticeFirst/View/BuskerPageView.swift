//
//  BuskerPageView.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/19.
//

import SwiftUI

struct BuskerPageView: View {
    var busker: Busker
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(busker.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                Text(busker.name)
                    .font(.title)
                    .fontWeight(.black)
                Spacer()
            }
        }.overlay(alignment: .bottomTrailing) {
            Button {
                //
            } label: {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(color: .white,radius: 5)
                    .padding()
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .scaleEffect(3)
                    }
            }
        }
    }
}

struct BuskerPageView_Previews: PreviewProvider {
    static var previews: some View {
        BuskerPageView(busker: dummyBusker5)
    }
}
