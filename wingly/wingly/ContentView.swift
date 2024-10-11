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
            ZStack(alignment: .center) {
                Color.white
                Image("splash_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthView * 0.266, height: heightView * 0.088)
            }
            .frame(width: widthView, height: heightView)
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
