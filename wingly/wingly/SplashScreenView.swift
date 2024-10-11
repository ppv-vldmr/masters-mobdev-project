//
//  SplashScreenView.swift
//  wingly
//
//  Created by Владимир Попов on 12.10.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var widthView = UIScreen.main.bounds.width
    @State private var heightView = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            Image("splash_logo")
                .resizable()
                .scaledToFit()
                .frame(width: widthView * 0.266, height: heightView * 0.088)
        }
        .frame(width: widthView, height: heightView)
    }
}

#Preview {
    SplashScreenView()
}
