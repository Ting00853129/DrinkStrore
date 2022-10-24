//
//  MenuView1.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView1: View {
    let drinks = [
        Menu(img: "黑糖珍珠奶茶", name: "黑糖珍珠奶茶"),
        Menu(img: "四季春雙星", name: "四季春雙星"),
        Menu(img: "黑糖珍珠鮮奶", name: "黑糖珍珠鮮奶"),
        Menu(img: "黑糖珍珠紅茶拿鐵", name: "黑糖珍珠紅茶拿鐵"),
        Menu(img: "伯爵珍珠鮮奶", name: "伯爵珍珠鮮奶"),
        Menu(img: "百香雙星", name: "百香雙星")
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

struct MenuView1_Previews: PreviewProvider {
    static var previews: some View {
        MenuView1()
    }
}
