//
//  MenuView6.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView6: View {
    let drinks = [
        Menu(img: "超級水果四季春", name: "超級水果四季春"),
        Menu(img: "木瓜牛奶", name: "木瓜牛奶"),
        Menu(img: "寒天葡萄柚綠茶", name: "寒天葡萄柚綠茶"),
        Menu(img: "蔓越莓冰醋", name: "蔓越莓冰醋"),
        Menu(img: "紅葡萄冰醋", name: "紅葡萄冰醋"),
        Menu(img: "梅子冰醋", name: "梅子冰醋"),
        Menu(img: "芭樂汁", name: "芭樂汁"),
        Menu(img: "火龍果芭樂", name: "火龍果芭樂"),
        Menu(img: "橙香火龍果", name: "橙香火龍果")
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


struct MenuView6_Previews: PreviewProvider {
    static var previews: some View {
        MenuView6()
    }
}
