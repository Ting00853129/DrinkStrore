//
//  AppDelegate.swift
//  DrinkStrore
//
//  Created by Victor Tao on 2022/10/25.
//

import SwiftUI
import AVFoundation

struct AppDelegate: View {
    let player = AVPlayer()
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                let fileUrl = Bundle.main.url(forResource: "Drinkstore", withExtension: "mp3")!
                let playerItem = AVPlayerItem(url: fileUrl)
                self.player.replaceCurrentItem(with: playerItem)
                self.player.play()
        }
    }
}

struct AppDelegate_Previews: PreviewProvider {
    static var previews: some View {
        AppDelegate()
    }
}

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   try? AVAudioSession.sharedInstance().setCategory(.playback)
   return true
}
