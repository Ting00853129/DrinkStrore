//
//  ContentView.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var opacity: Double = 0
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
                .padding(.vertical, 250.0)
                
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
                        CategoryView(view: AnyView(MenuView()), text:"經典奶茶系列")
                        CategoryView(view: AnyView(MenuView()), text:"茶拿鐵系列")
                        CategoryView(view: AnyView(MenuView()), text:"醇品鮮茶系列")
                    } header: {
                        Text("找茶")
                    }
                    Section{
                        CategoryView(view: AnyView(MenuView()), text:"手作鮮果茶系列")
                        CategoryView(view: AnyView(MenuView()), text:"鮮果汁系列")
                    } header: {
                        Text("找果汁")
                    }
                }
                .navigationTitle("MENU")
            }
            .tabItem {
                Label("MENU", systemImage: "menucard")
            }
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
