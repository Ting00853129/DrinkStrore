//
//  ContentView.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/23.
//

import SwiftUI
import AVFoundation
import MapKit
import CoreLocation
struct IdentifiablePlace: Identifiable {
    let id = UUID()
    let location: CLLocationCoordinate2D
    
    init(lat: Double, long: Double) {
        location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
struct ContentView: View {
    @State private var opacity: Double = 0
    @State var looper: AVPlayerLooper?
    @State private var isPlay = false
    let player = AVPlayer()
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.130920, longitude: 121.745471), latitudinalMeters: 1000, longitudinalMeters: 1000)
    let items = [
        IdentifiablePlace(lat: 25.130920, long: 121.745471)
    ]
    var body: some View {
        
        TabView {
            VStack{
                Link(destination: URL(string: "https://www.drinkstore.com.tw/home.jsp")!, label:{ Image("logo")
                        .resizable()
                        .scaledToFit()
                        .opacity(opacity)
                        .animation(.linear(duration: 3), value: opacity)
                        .onAppear{
                            opacity += 1
                        }
                })
                .padding(.leading, 10.0)
                .padding(.vertical, 90.0)
                Map(coordinateRegion: $region,  annotationItems: items){ item in
                    MapMarker(coordinate:CLLocationCoordinate2D(latitude: 25.130920, longitude: 121.745471),tint: .red)
                }
                .padding(.bottom, 50.0)
                .frame(width: 300.0, height: 300.0)
                HStack{
                    Link(destination: URL(string: "https://www.instagram.com/twdrinkstore/")!, label:{ Image("ig")
                            .resizable()
                            .frame(width: 50.0, height: 40.0)
                            .scaledToFit()
                    })
                    Link(destination: URL(string: "https://www.facebook.com/drinkcloudstore/?eid=ARDzPhqfaaaq7w0ONOVS3y1oxvNHeasDb2f0L1y9aBNmTdXV0MyPMKm5OIViT7JJSCUlYZH6TpU354JX&hc_ref=ARRg3_0AJIdMinn0Uca6D3Rjq3QkVlAz_rrfbour0uY5JArSFDPtL4p0FZU77QX40Mk&__xts__[0]=68.ARDotfVoGbNw2bmAeCXMKPNUWJsBdtc6ESfpIAUupTdTcXuua_Mgn2tsUcNjBeVzlcZ2rgTvwO5v9YRC9V6tYdR1jkQs5s7FQAbj_mBBDA0ZPRcBcrfoF4fufAYI5-0ueCnSiXvvvwVxMm7OfGlOZW428T9QAO9pYfWh0O3jUtCOiabNJk5jwEc8CfgdBpr3TsxKNx2sGSguIzWj1jMqh8OAlhIDCm2jJmuyrBXPUEVITGaRj0Y5Et5NHWRAxda5zCA3cB9GNYjXoorQUOTAiuSYdV7zDCp4h0Tqu0n9cwaq2rgs")!, label:{ Image("fb")
                            .resizable()
                            .frame(width: 40.0, height: 40.0)
                            .scaledToFit()
                    })
                    .padding(.horizontal)
                    Link(destination: URL(string: "https://lin.ee/BTqie5L")!, label:{ Image("line")
                            .resizable()
                            .frame(width: 40.0, height: 40.0)
                        .scaledToFit()})
                    
                    .padding(.trailing)
                    Link(destination: URL(string: "http://maps.apple.com/?address=基隆市中正區義二路26號".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!, label:{ Image(systemName: "map")
                            .resizable()
                            .frame(width: 40.0, height: 40.0)
                            .scaledToFit()
                            .foregroundColor(.black)
                    })
                    Button {
                        isPlay = !isPlay
                    } label: {
                        if(isPlay){
                            Image(systemName: "speaker.wave.2.circle.fill")
                                .resizable()
                                .frame(width: 30.0, height: 40.0)
                        } else{
                            Image(systemName: "speaker.slash.circle.fill")
                                .resizable()
                                .frame(width: 30.0, height: 40.0)
                        }
                        
                    }.padding(.leading)
                        .onChange(of: isPlay, perform: { value in
                            let fileUrl = Bundle.main.url(forResource: "Drinkstore", withExtension: "mp3")!
                            let playerItem = AVPlayerItem(url: fileUrl)
                            player.replaceCurrentItem(with: playerItem)
                            if value {
                                player.play()
                            } else {
                                player.pause()
                            }
                        })
                }
            }
            .tabItem {
                Label("HOME", systemImage: "house")
            }
            NavigationView {
                List{
                    Section{ CategoryView(view: AnyView(MenuView()), text:"季節限定系列");
                    } header:{ Text("找限定")}
                    Section{
                        CategoryView(view: AnyView(MenuView1()), text:"黑糖珍珠系列")
                    } header: {
                        Text("找珍珠")
                    }
                    Section{
                        CategoryView(view: AnyView(MenuView2()), text:"經典奶茶系列")
                        CategoryView(view: AnyView(MenuView3()), text:"茶拿鐵系列")
                        CategoryView(view: AnyView(MenuView4()), text:"醇品鮮茶系列")
                    } header: {
                        Text("找茶")
                    }
                    Section{
                        CategoryView(view: AnyView(MenuView5()), text:"手作鮮果茶系列")
                        CategoryView(view: AnyView(MenuView6()), text:"鮮果汁系列")
                    } header: {
                        Text("找果汁")
                    }
                    Section{
                        CategoryView(view: AnyView(MenuView7()), text:"偷偷告訴你我最愛的飲料")
                    } header: {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("我的最愛")
                        }
                    }
                }
                .navigationTitle("MENU")
            }
            .tabItem {
                Label("MENU", systemImage: "menucard")
            }
            NavigationView {
                OrderView()
                    .navigationTitle("Order")
            }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
            
        }
        .onAppear {
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CategoryView: View {
    var view : AnyView
    var text : String
    var body: some View {
        
        NavigationLink{
            view
        } label: {
            Text(text)
        }
    }
}


