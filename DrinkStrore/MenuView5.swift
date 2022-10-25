//
//  MenuView5.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI

struct MenuView5: View {
    let drinks = [
        Menu(img: "百香蜂蜜優酪爽", name: "百香蜂蜜優酪爽"),
        Menu(img: "完全檸檬鮮榨綠", name: "完全檸檬鮮榨綠"),
        Menu(img: "完全檸檬蜜蘆薈", name: "完全檸檬蜜蘆薈"),
        Menu(img: "完全檸檬蜜愛玉", name: "完全檸檬蜜愛玉"),
        Menu(img: "完全檸檬蜜百香", name: "完全檸檬蜜百香"),
        Menu(img: "手榨檸檬四季春", name: "手榨檸檬四季春"),
        Menu(img: "手榨金桔檸檬", name: "手榨金桔檸檬"),
        Menu(img: "蜂蜜檸檬", name: "蜂蜜檸檬"),
        Menu(img: "甘蔗青茶", name: "甘蔗青茶")
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

struct MenuView5_Previews: PreviewProvider {
    static var previews: some View {
        MenuView5()
    }
}
