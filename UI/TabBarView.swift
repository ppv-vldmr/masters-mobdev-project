//
//  TabBarView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .frame(width: 316, height: 60)
                    .cornerRadius(200)
                
                HStack {
                
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 44)
                            .cornerRadius(22)
                        Image(uiImage: UIImage(named: "tabbar1")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    
                    Spacer()
                   
                    Image(uiImage: UIImage(named: "tabbar2")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Spacer()
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255))
                                .frame(width: 44, height: 44)
                                .cornerRadius(22)
                            Image(uiImage: UIImage(named: "tabbar3")!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: "tabbar4")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: "tabbar5")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                }
                .frame(width: 300, height: 60)
            }
        }
    }
}

#Preview {
    TabBarView()
}
