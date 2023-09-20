//
//  MapView.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//
import SwiftUI
import MapKit
import CoreLocationUI

struct MapView : View {
    
    //MARK: -1.PROPERTY
    @ObservedObject var mapController: MapController
    @StateObject private var mapVM = MapViewModel()
    @State var isShowingModal: Bool = false
    @State var selectedBusking: Busking = dummyBusking3
    let locations: [Busking] = dummyBuskingNow
    
    
    
    //MARK: -2.BODY
    var body: some View {
        Map(coordinateRegion: $mapVM.region, showsUserLocation: true, annotationItems: locations, annotationContent: { item in
            MapAnnotation(coordinate: item.location) {
                Button {
                    selectedBusking = item
                    isShowingModal = true
                } label: {
                    MapAnnotationView(location: item)
                }
            }
        })
        .ignoresSafeArea()
        .tint(.blue)
        .sheet(isPresented: $isShowingModal) {
            MapBuskerInfo(busking: selectedBusking)
                .presentationDetents([.height(600)])
        }
        
        .overlay(alignment: .bottomTrailing){
            LocationButton(.currentLocation) {
                mapVM.requestAllowOnceLocationPermission()
            }
            .foregroundColor(.black)
            .labelStyle(.iconOnly)
            .cornerRadius(20)
            .symbolVariant(.fill)
            .tint(.white)
            .scaleEffect(1.5)
            .padding(30)
        }
    }
}


//MARK: -3.PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapController: MapController())
    }
}


extension MapView {
   
}
