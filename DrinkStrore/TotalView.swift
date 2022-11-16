//
//  TotalView.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/11/16.
//

import SwiftUI

struct TotalView: View {
    
    @Binding var showSheet : Bool
    @Binding var name : String
    @Binding var phone : String
    @Binding var grader : String
    @Binding var time : Date
    @Binding var ice : Double
    @Binding var sweet : Double
    @Binding var isVoice : Bool
    @Binding var cupColor : Color
    @Binding var drink : String
    @Binding var count : Double
    @Binding var comment : String
    @Binding var bonus : Int
    
    var bonuses :[String] = ["買一送一","折十元","折五元","沒有優惠ＱＱ"]
    var sweetChoice :[String] = ["無糖", "微糖", "半糖", "少糖", "全糖","多糖"]
    var iceChoice :[String] = ["熱飲", "去冰", "微冰", "少冰", "正常","多冰"]
    var body: some View {
        List{
            Text("訂購人 \(name)")
            HStack {
                Text("電話 \(phone)")
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("性別 \(grader)")
                    .multilineTextAlignment(.trailing)
            }
            Text("領餐時間 \(time.formatted(.dateTime))")
            HStack {
                Text("今日飲料 \(drink)")
                Spacer()
                Text("\(Int(count)) 杯")
            }
            HStack {
                Text("甜度 \(iceChoice[Int(ice/2.0)])")
                Spacer()
                Text("冰塊 \(sweetChoice[Int(sweet/2.0)])")
            }
            HStack {
                Text("杯子顏色 ")
                Spacer()
                Text("       ")
                    .background(cupColor)
            }
            if(isVoice){
                Text("需要發票，下一個暴富就是你")
            } else{
                Text("不需要發票，好人一生平安")
            }
            Text("今日優惠 \(bonuses[bonus])")
            Text("備注 \(comment)")
            
        }
        Button("關閉") {
            showSheet = false
        }
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView(showSheet: .constant(true) ,name : .constant(String()), phone : .constant(String()), grader: .constant(String()), time: .constant(Date()), ice: .constant(Double()), sweet: .constant(Double()), isVoice: .constant(Bool()), cupColor: .constant(Color(red: Double(), green: Double(), blue: Double())), drink: .constant(String()), count: .constant(Double()), comment: .constant(String()), bonus: .constant(Int()))
    }
}
