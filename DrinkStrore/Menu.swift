//
//  Menu.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import Foundation

struct Menu: Hashable, Identifiable{
    var img : String
    var name : String
    var id: String { name }
    
    static let drinks = [
        Menu(img: "黑糖珍珠奶茶", name: "黑糖珍珠奶茶"),
        Menu(img: "四季春雙星", name: "四季春雙星"),
        Menu(img: "黑糖珍珠鮮奶", name: "黑糖珍珠鮮奶"),
        Menu(img: "黑糖珍珠紅茶拿鐵", name: "黑糖珍珠紅茶拿鐵"),
        Menu(img: "伯爵珍珠鮮奶", name: "伯爵珍珠鮮奶"),
        Menu(img: "百香雙星", name: "百香雙星")
    ]
}


