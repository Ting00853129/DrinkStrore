//
//  MenuView4.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView4: View {
    let drinks = [
        Menu(img: "伯爵嚼嚼紅茶", name: "伯爵嚼嚼紅茶"),
        Menu(img: "嚼嚼茉香綠茶", name: "嚼嚼茉香綠茶"),
        Menu(img: "茉香綠茶", name: "茉香綠茶"),
        Menu(img: "手煮蔗香紅茶", name: "手煮蔗香紅茶"),
        Menu(img: "伯爵紅茶", name: "伯爵紅茶"),
        Menu(img: "四季春青茶", name: "四季春青茶"),
        Menu(img: "烏龍青茶", name: "烏龍青茶"),
        Menu(img: "養樂多綠茶", name: "養樂多綠茶")
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

struct MenuView4_Previews: PreviewProvider {
    static var previews: some View {
        MenuView4()
    }
}
