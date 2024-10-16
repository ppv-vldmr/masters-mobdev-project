//
//  FeedView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                HStack {
                    Image(uiImage: UIImage(named: "bell")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.top, 20)
                }
                .opacity(0)
                .padding(.leading, 100)
                
                Image("Logo_start")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, 20)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(uiImage: UIImage(named: "bell")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.top, 20)
                    }
                }
                .padding(.leading, 100)
            }
            
            HStack {
                Text("Для вас")
                    .font(Font.custom("VelaSans-Bold", size: 16))
                
                Spacer()
                
                Text("Рекомендации")
                    .font(Font.custom("VelaSans-Bold", size: 16))
                    .opacity(0.4)
            }
            .frame(width: 250)
            .padding(.top, 5)
            
            ZStack {
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
                    .padding(.top)
                
                Rectangle()
                    .frame(width: 100, height: 3)
                    .foregroundStyle(Color(red: 134 / 255, green: 93 / 255, blue: 230 / 255))
                    .padding(.top)
                    .padding(.trailing, 190)
            }
            
            ZStack {
                ScrollView {
                    FeedPostView()
                    
                    FeedPostWithRepost()
                        .padding(.top, 10)
                    
                    Rectangle()
                        .frame(height: 55)
                        .opacity(0)
                }
                .scrollIndicators(.hidden)
                .frame(height: 630)
                .padding(.top)
                
                
                Spacer()
                
                TabBarView()
            }
        }
    }
}

#Preview {
    FeedView()
}
