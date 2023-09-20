//
//  ContentView.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct ContentView: View {
    //MARK: -1.PROPERTY
    @StateObject var kakaoAuthVM : KakaoAuthVM = KakaoAuthVM()

    
    //MARK: -2.BODY
    var body: some View {
                TabView {
                        MainView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Main Page")
                            }
                        MapView(mapController: MapController())
                            .tabItem {
                                Image(systemName: "map")
                                Text("Map")
                            }
                        MyProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("My Profile")
                            }
                    }
            }
        }


    //MARK: -3.PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
