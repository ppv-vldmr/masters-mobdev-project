//
//  SavedView.swift
//  wingly
//
//  Created by Владимир Попов on 23.11.2024.
//

import SwiftUI

struct SavedView: View {
    
    @AppStorage("save_post") var savePost = false
    @AppStorage("save_repost") var saveRepost = false
    
    @State private var heightView = UIScreen.main.bounds.height
    @State private var widthView = UIScreen.main.bounds.width
    
    var backToFeed: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if savePost || saveRepost {
                    ScrollView {
                        if savePost {
                            FeedPostView()
                        }
                        if saveRepost {
                            FeedPostWithRepost()
                                .padding(.top, 10)
                        }
                    }
                    .frame(height: heightView * 0.85)
                } else {
                    Spacer()
                    
                    HStack(alignment: .center) {
                        VStack {
                            Text("Вы не добавили ни один пост в Избранное\nДобавьте хотя бы один пост и здесь появится\nлента Избранного")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(red: 137 / 255, green: 137 / 255, blue: 137 / 255))
                            
                            Button {
                                backToFeed()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: widthView * 0.9, height: heightView * 0.07)
                                        .cornerRadius(20)
                                        .foregroundStyle(Color(red: 134 / 255, green: 93 / 255, blue: 230 / 255))
                                    
                                    Text("Перейти на Главную")
                                        .font(Font.custom("VelaSans-Bold", size: 16))
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 40)
                    
                    Spacer()
                }
            }
            .frame(height: heightView)
            .navigationTitle("Избранное")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SavedView(backToFeed: {})
}
