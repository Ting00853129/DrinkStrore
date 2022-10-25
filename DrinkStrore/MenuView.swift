//
//  MenuView.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/23.
//

import SwiftUI

struct MenuView: View {
    let drinks = [
        Menu(img: "楊枝甘露", name: "楊枝甘露"),
        Menu(img: "葡式芝味果粒", name: "葡式芝味果粒"),
        Menu(img: "芝士芒芒果粒", name: "芝士芒芒果粒"),
        Menu(img: "芝士火龍果", name: "芝士火龍果")
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
