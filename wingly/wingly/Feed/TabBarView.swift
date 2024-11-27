//
//  TabBarView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var heightView = UIScreen.main.bounds.height
    
    @State private var showFeed = true
    @State private var showProfile = false
    @State private var showSaved = false
    
    var body: some View {
        ZStack {
            if showFeed {
                FeedView()
            } else if showSaved {
                SavedView(backToFeed: {
                    showFeed = true
                    showProfile = false
                    showSaved = false
                })
            } else if showProfile {
                ProfileView()
            } else {
                Color.white
            }
        }
        .frame(height: heightView)
        .clipped()
        .overlay {
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 316, height: 60)
                        .cornerRadius(200)
                    
                    HStack {
                    
                        Button {
                            showFeed = true
                            showSaved = false
                            showProfile = false
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44)
                                    .cornerRadius(22)
                                    .opacity(showFeed ? 1 : 0)
                                Image(uiImage: UIImage(named: "tabbar1")!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
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
                        
                        Button {
                            showFeed = false
                            showSaved = true
                            showProfile = false
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44)
                                    .cornerRadius(22)
                                    .opacity(showSaved ? 1 : 0)
                                Image(uiImage: UIImage(named: "tabbar4")!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        
                        
                        Spacer()
                        
                        Button {
                            showFeed = false
                            showSaved = false
                            showProfile = true
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44)
                                    .cornerRadius(22)
                                    .opacity(showProfile ? 1 : 0)
                                Image(uiImage: UIImage(named: "tabbar5")!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                    .frame(width: 300, height: 60)
                }
                .padding(.bottom, heightView * 0.05)
            }
        }
    }
}

#Preview {
    TabBarView()
}
