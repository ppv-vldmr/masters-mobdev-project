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
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .frame(width: widthView, height: heightView)
        }
    }
}

#Preview {
    ContentView()
}
