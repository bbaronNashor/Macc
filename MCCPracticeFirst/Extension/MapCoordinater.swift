//
//  MapCoordinater.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import MapKit
import SwiftUI
import CoreLocationUI

class MapController: ObservableObject {
    var searchTerm = ""
        @Published var isBusinessViewShowing = false
        @Published private(set) var businesses = [Business]()
        @Published private(set) var selectedBusiness: Business?
        @Published private(set) var actions = [Action]()
    private let initialLatitude: Double = 37.557192
    private let initialLongitude: Double = 126.925381

    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.557192, longitude: 126.925381), latitudinalMeters: 200, longitudinalMeters: 200)

    var latitude: Double {
        get {
            return region.center.latitude
        }
        set {
            region.center.latitude = newValue
        }
    }

    var longitude: Double {
        get {
            return region.center.longitude
        }
        set {
            region.center.longitude = newValue
        }
    }

    var selectedBusinessName: String {
        guard let selectedBusiness = selectedBusiness else { return "" }
        return selectedBusiness.name
    }
    
    var selectedBusinessPlacemark: String {
        guard let selectedBusiness = selectedBusiness else { return "??" }
        return selectedBusiness.placemark.title ?? "??"
    }
    
    func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else { return }
            
            DispatchQueue.main.async {
                self.businesses = response.mapItems.map { item in
                    Business(name: item.name ?? "", placemark: item.placemark, coordinate: item.placemark.coordinate, phoneNumber: item.phoneNumber ?? "", website: item.url)
                }
            }
        }
        // make a function that createActions()
        createActions()
    }
    
    func openMap(coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps()
    }
    
    func setSelectedBusiness(for business: Business) {
        selectedBusiness = business
        isBusinessViewShowing.toggle()
    }
    
    func createActions() {
        actions = [
            Action(title: "Directions", image: "car.fill") { [weak self] in
                guard let self = self else { return }
                self.openMap(coordinate: self.selectedBusiness!.coordinate)
            },
            Action(title: "Call", image: "phone.fill") { [weak self] in
                guard let self = self else { return }
                guard let phoneNumber = self.selectedBusiness?.phoneNumber else { return }
                guard let url = URL(string: self.convertPhoneNumberFormat(phoneNumber: phoneNumber)) else { return }
                UIApplication.shared.open(url)
            },
            Action(title: "Website", image: "safari.fill") { [weak self] in
                guard let self = self else { return }
                guard let website = self.selectedBusiness?.website else { return }
                UIApplication.shared.open(website)
            }
        ]
    }
    
    func convertPhoneNumberFormat(phoneNumber: String) -> String {
        let strippedPhoneNumber = phoneNumber
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        
        return "tel//\(strippedPhoneNumber)"
    }
    
}


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
//    @Published var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 40, longitude: 40) ,
//        span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    @Published var region = MKCoordinateRegion()
    
    let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self
        self.requestAllowOnceLocationPermission()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
    }
    
    func requestAllowOnceLocationPermission(){
//        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{ return }
        DispatchQueue.main.async{[weak self] in
            self?.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                                                
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}





