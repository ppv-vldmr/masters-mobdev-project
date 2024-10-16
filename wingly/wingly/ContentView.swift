//
//  ContentView.swift
//  wingly
//
//  Created by Владимир Попов on 06.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var widthView = UIScreen.main.bounds.width
    @State private var heightView = UIScreen.main.bounds.height
    
    @AppStorage("log_Status") var status = false
    @AppStorage("is_newbie") var isNewbie = false
    @AppStorage("user_login") var userLogin = ""
    
    @State private var showSplashScreen = true
    
    var body: some View {
        if showSplashScreen {
            SplashScreenView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showSplashScreen = false
                    }
                }
        } else {
            if !status {
                StartView()
            } else {
                if isNewbie {
                    if userLogin.isEmpty {
                        CreateLoginView()
                    } else {
                        CreateProfileScreenView()
                    }
                } else {
                    FeedView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
