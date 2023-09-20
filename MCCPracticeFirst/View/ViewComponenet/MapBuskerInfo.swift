//
//  MapBuskerInfo.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/19.
//

import SwiftUI

struct MapBuskerInfo: View {
    //MARK: -1.PROPERTY
    @State var isClickedLike: Bool = false
    var busking: Busking
    
    
    //MARK: -2.BODY
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Text(busking.name)
                    .font(.title)
                    .fontWeight(.black)
                Spacer()
                Button {
                    isClickedLike.toggle()
                } label: {
                    Image(systemName: isClickedLike ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(.pink)
                        .padding(.trailing, 5)
                    
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 30)
            Image(busking.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .padding(.vertical, 30)
                .shadow(color: .white,radius: 5)
            Text("13:00 ~ 16:00")
                .fontWeight(.black)
                .padding(.vertical, 10)
            Button {
                
            } label: {
                Text("더보기")
                    .fontWeight(.black)
                    .frame(width: 300, height: 50)
                    .background(.ultraThinMaterial)
                    .cornerRadius(30)
            }
            Button {
                
            } label: {
                Text("찾아가기")
                    .fontWeight(.black)
                    .frame(width: 300, height: 50)
                    .background(.ultraThinMaterial)
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .frame(height: 600)
    }
}

    //MARK: -3.PREVIEW
struct MapBuskerInfo_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapController: MapController())
    }
}
