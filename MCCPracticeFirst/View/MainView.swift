//
//  MainView.swift
//  MCCPracticeFirst
//
//  Created by Kimjaekyeong on 2023/09/18.
//

import SwiftUI

struct MainView: View {
    //MARK: - 1.PROPERTY
    @State var isClickedBuskingInfo: Bool = false
    @State var selectedBusking: Busking = dummyBusking1
    
    var user : User = dummyUser
    //MARK: - 2.BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30){
                    
                    MyProfileSection
                    Divider()
                    MyartistSection
                    Divider()
                    BuskingInfoSection
                }
            }
            .padding(.horizontal,5)
            .padding(.vertical, 60)
            .padding(.bottom, 20)
            .ignoresSafeArea()
            .navigationTitle("")
        }
        
    }
}
//MARK: - 3.PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//MARK: - 4.EXTENSION
extension MainView {
    
    
    var MyProfileSection: some View {
        return VStack {
            HStack{
                Text("My Profile")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
            }
            HStack{
                ProfileCircle(image: user.image)
                    .padding(.trailing, 30)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
        }.padding(.top,40)
    }
    
    var MyartistSection: some View {
        return VStack {
            HStack {
                Text("My Artist")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 16) {
                    ForEach(user.following) { i in
                        NavigationLink {
                            BuskerPageView(busker: i)
                        } label: {
                            ProfileCircle(image: i.image)
                        }                    }
                    Circle()
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .scaleEffect(2)
                        }
                }
            }
        }
        
    }
    
    var BuskingInfoSection: some View {
        return VStack {
            HStack {
                Text("Busking Info")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
            }
            
            VStack {
                ForEach(dummyBuskingNow) { i in
                    HStack {
                        ProfileCircle(image: i.image)
                            .padding(.trailing, 30)
                        VStack(alignment: .leading) {
                            Text(i.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                            Text("2023/12/23")
                                .font(.callout)
                                .fontWeight(.semibold)
                            Text(i.time)
                                .font(.callout)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .onTapGesture {
                        selectedBusking = i
                        isClickedBuskingInfo = true
                    }
                    .sheet(isPresented: $isClickedBuskingInfo) {
                        MapBuskingInfo(mapController: MapController(),busking: selectedBusking)
                    }
                }
            }
        }
    }
}
