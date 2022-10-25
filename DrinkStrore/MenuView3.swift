//
//  MenuView3.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView3: View {
    let drinks = [
        Menu(img: "燕麥紅茶拿鐵", name: "燕麥紅茶拿鐵"),
        Menu(img: "紫米芋泥波波", name: "紫米芋泥波波"),
        Menu(img: "紫米芋芋鮮奶", name: "紫米芋芋鮮奶"),
        Menu(img: "紫米紅豆鮮奶", name: "紫米紅豆鮮奶"),
        Menu(img: "伯爵嚼嚼鮮奶", name: "伯爵嚼嚼鮮奶"),
        Menu(img: "伯爵鮮奶茶", name: "伯爵鮮奶茶"),
        Menu(img: "紅茶拿鐵", name: "紅茶拿鐵"),
        Menu(img: "法式可可鮮奶", name: "法式可可鮮奶"),
        Menu(img: "甲級芋頭鮮奶", name: "甲級芋頭鮮奶")
    ]
    var body: some View {
        ScrollView(){
            ForEach(drinks, id: \.img) { drink in
                HStack(alignment: .center){
                    Image("\(drink.img)")
                        .resizable()
                        .frame(width: 180.0, height: 270.0)
                        .scaledToFit()
                    Text("\(drink.name)")
                        .multilineTextAlignment(.leading)
                        .frame(width: 110.0, height: 270.0)
                    
                }.frame(width: 290.0, height: 270.0)
            }
            
        }
    }
}

struct MenuView3_Previews: PreviewProvider {
    static var previews: some View {
        MenuView3()
    }
}
