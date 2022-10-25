//
//  MenuView7.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView7: View {
    let drinks = [
        Menu(img: "鄧不利多奶綠", name: "鄧不利多奶綠")
    ]
    var body: some View {
        VStack{
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
            Text("鹹鹹的芝士奶蓋")
                .multilineTextAlignment(.leading)
            Text("遇上甜到心裡的奶茶")
                .multilineTextAlignment(.center)
            Text("再用綠茶去掉膩感")
                .multilineTextAlignment(.trailing)
            Text("夏天必須來一杯微冰微糖的鄧不利多奶綠！")
                .multilineTextAlignment(.center)
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "heart")
                Image(systemName: "heart.fill")
                Image(systemName: "heart")
                Image(systemName: "heart.fill")
            }
        }
    }
}

struct MenuView7_Previews: PreviewProvider {
    static var previews: some View {
        MenuView7()
    }
}
