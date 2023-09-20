//
//  MapAnnotationView.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    
    @State private var animation: Double = 0.0
    @State var isShowingModal: Bool = false
    var location: Busking
    
    // MARK: - BODY
    
    var body: some View {
        
//        Button {
//            isShowingModal = true
//        } label: {
            ZStack {
                Circle()
                    .fill(Color.teal)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Circle()
                    .stroke(Color.teal, lineWidth: 2)
                    .frame(width: 100, height: 100, alignment: .center)
                    .scaleEffect(1 + CGFloat(animation))
                    .opacity(1 - animation)
                    .shadow(color: .cyan,radius: 5)
                
                Circle()
                    .stroke(Color.teal, lineWidth: 2)
                    .frame(width: 85, height: 85, alignment: .center)
                    .scaleEffect(1 + CGFloat(animation))
                    .opacity(1 - animation)
                    .shadow(color: .cyan,radius: 5)
                
                Circle()
                    .stroke(Color.teal, lineWidth: 2)
                    .frame(width: 70, height: 70, alignment: .center)
                    .scaleEffect(1 + CGFloat(animation))
                    .opacity(1 - animation)
                    .shadow(color: .cyan,radius: 5)
                
                Image(location.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96, alignment: .center)
                    .clipShape(Circle())
            } //: ZSTACK
            .onAppear {
                withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
            .shadow(color: .white.opacity(0.5) ,radius: 5)
//        }
        
        
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
//    static var locations: [Busking] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapView(mapController: MapController())
    }
}
