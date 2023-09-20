//
//  MapBuskingInfo.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/19.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapBuskingInfo: View {
    //MARK: -1.PROPERTY
    @ObservedObject var mapController: MapController
    @State var isClickedLike: Bool = false
    var latitude: Double = dummyUser.latitude
    var longitude: Double = dummyUser.longitude
    var userLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
    let locations: [Busking] = dummyBuskingNow
    var busking: Busking
    @State var buskerLocation: MKCoordinateRegion = MKCoordinateRegion()
    
    
    //MARK: -2.BODY
    var body: some View {
        
        var buskingLocation: [Busking] = [busking]
      
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
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .padding(.top, 30)
                .shadow(color: .white,radius: 5)
            Text(busking.time)
                .fontWeight(.black)
                .padding(.top)
            Text("서울시 연남동 경의선 숲길")
                .fontWeight(.black)
                .padding(.bottom)
            Map(coordinateRegion: $buskerLocation, showsUserLocation: true, annotationItems: buskingLocation, annotationContent: { item in
                
                MapAnnotation(coordinate: item.location) {
                        MapAnnotationView(location: item)
                }
            })
            .cornerRadius(10)
            Spacer()
        }
        .frame(height: 760)
        .onAppear{
            buskerLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: busking.latitude, longitude: busking.longitude), latitudinalMeters: 200, longitudinalMeters: 200)
        }
    }
}

struct MapBuskingInfo_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
