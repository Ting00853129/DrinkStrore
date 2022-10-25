//
//  MenuView2.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView2: View {
    let drinks = [
        Menu(img: "蜂蜜燕麥奶綠", name: "蜂蜜燕麥奶綠"),
        Menu(img: "荔枝椰果奶茶", name: "荔枝椰果奶茶"),
        Menu(img: "甲級芋頭奶茶", name: "甲級芋頭奶茶"),
        Menu(img: "霍格華茲奶茶", name: "霍格華茲奶茶"),
        Menu(img: "鄧不利多奶綠", name: "鄧不利多奶綠"),
        Menu(img: "麻瓜布丁奶茶", name: "麻瓜布丁奶茶"),
        Menu(img: "起司奶沫綠茶", name: "起司奶沫綠茶"),
        Menu(img: "日式可可奶沫", name: "日式可可奶沫")
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

struct MenuView2_Previews: PreviewProvider {
    static var previews: some View {
        MenuView2()
    }
}
