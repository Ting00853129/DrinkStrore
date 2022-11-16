//
//  OrderView.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/11/15.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct OrderView: View {
    @State private var name = ""
    @State private var snackTime = Date()
    @State private var sweet: Double = 0
    @State private var ice: Double = 0
    @State private var phone = ""
    @State private var comment = ""
    @State private var selectGrader = "男"
    @State private var isVoice = true
    @State private var bgColor = Color.white
    @State private var selectedDrink = "黑糖珍珠奶茶"
    @State private var bonusNum : Int = 0
    @State private var drinkAmount = 1.0
    @State private var showAlert = false
    @State private var showSheet = false
    var bonus :[String] = ["買一送一","折十元","折五元","沒有優惠ＱＱ"]
    let drinks = ["黑糖珍珠奶茶", "四季春雙星", "黑糖珍珠鮮奶", "黑糖珍珠紅茶拿鐵", "伯爵珍珠鮮奶", "百香雙星","楊枝甘露", "葡式芝味果粒", "芝士芒芒果粒", "芝士火龍果","蜂蜜燕麥奶綠","荔枝椰果奶茶", "甲級芋頭奶茶", "霍格華茲奶茶", "鄧不利多奶綠", "麻瓜布丁奶茶", "起司奶沫綠茶", "日式可可奶沫", "燕麥紅茶拿鐵", "紫米芋泥波波", "紫米芋芋鮮奶", "紫米紅豆鮮奶", "伯爵嚼嚼鮮奶", "伯爵鮮奶茶", "紅茶拿鐵", "法式可可鮮奶", "甲級芋頭鮮奶", "伯爵嚼嚼紅茶", "嚼嚼茉香綠茶", "茉香綠茶", "手煮蔗香紅茶", "伯爵紅茶", "四季春青茶", "烏龍青茶", "養樂多綠茶", "百香蜂蜜優酪爽", "完全檸檬鮮榨綠", "完全檸檬蜜蘆薈", "完全檸檬蜜愛玉", "完全檸檬蜜百香", "手榨檸檬四季春", "手榨金桔檸檬", "蜂蜜檸檬", "甘蔗青茶","超級水果四季春", "木瓜牛奶", "寒天葡萄柚綠茶", "蔓越莓冰醋", "紅葡萄冰醋", "梅子冰醋", "芭樂汁", "火龍果芭樂","橙香火龍果"]
    let graders = ["男", "女"]
    let authors = ["楊枝甘露", "葡式芝味果粒", "芝士芒芒果粒", "芝士火龍果"]
    var body: some View {
        VStack() {
            Form{
                Group {
                    TextField("名字", text: $name, prompt: Text("名字"))
                    TextField("電話", text: $phone, prompt: Text("電話"))
                        .keyboardType(.numberPad)
                    Picker(selection: $selectGrader) {
                        ForEach(graders, id: \.self) { grader in
                            Text(grader)
                        }
                    } label: {
                    }
                    .pickerStyle(.segmented)
                    DatePicker("領取時間", selection: $snackTime, in: Date()... )
                    HStack(alignment: .center) {
                        Picker(selection: $selectedDrink) {
                            ForEach(drinks) { drink in
                                HStack() {
                                    Text(drink)
                                        .font(.body)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        } label: {
                            Text("選擇飲料")
                        }
                        .frame(width: 170.0)
                        .labelsHidden()
                        Spacer()
                        Stepper("\(drinkAmount.formatted()) 杯", value: $drinkAmount,in:0 ... 9, step: 1.0)
                    }
                }
                
                HStack {
                    Text("甜度")
                    if(sweet == 0){
                        Text("無糖")
                    }else if(sweet == 2){
                        Text("微糖")
                    }else if(sweet == 4){
                        Text("半糖")
                    }else if(sweet == 6){
                        Text("少糖")
                    }else if(sweet == 8){
                        Text("全糖")
                    }else if(sweet == 10){
                        Text("多糖")
                    }
                    Slider(value: $sweet, in: 0...10, step: 2)
                }
                HStack {
                    Text("冰塊")
                    if(ice == 0){
                        Text("熱飲")
                    }else if(ice == 2){
                        Text("去冰")
                    }else if(ice == 4){
                        Text("微冰")
                    }else if(ice == 6){
                        Text("少冰")
                    }else if(ice == 8){
                        Text("正常")
                    }else if(ice == 10){
                        Text("多冰")
                    }
                    Slider(value: $ice, in: 0...10, step: 2)
                }
                DisclosureGroup("今日推薦") {
                    ForEach(authors, id: \.self) { author in
                        Text(author)
                    }
                }
                Toggle(isOn: $isVoice){
                    Text(isVoice ? "我要發票我要暴富":"發票都捐捐捐")
                }
                HStack {
                    ColorPicker("杯子顏色", selection: $bgColor)
                    
                    Text("        ")
                        .background(bgColor)
                }
                
            }
            HStack{
                Text("備註")
                TextEditor(text: $comment)
                    .frame(width: 300, height: 50)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
            }
            HStack {
                Spacer()
                Button {
                    bonusNum = Int.random(in: 0 ... 3)
                    showAlert = true
                } label: {
                    Text("抽取今日優惠")
                }
                .alert("今日優惠 " + bonus[bonusNum], isPresented: $showAlert) {
                    Button("確認") {
                        
                    }
                }
                Spacer()
                Button {
                    showSheet = true
                } label: {
                    Text("送出訂單")
                }
                .sheet(isPresented: $showSheet, content:{
                    TotalView(showSheet: $showSheet, name : $name, phone : $phone, grader: $selectGrader, time: $snackTime, ice: $ice, sweet: $sweet, isVoice: $isVoice, cupColor: $bgColor, drink: $selectedDrink, count: $drinkAmount, comment: $comment, bonus: $bonusNum)
                })
                Spacer()
            }
            
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
