//
//  FeedPostSecondType.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

struct FeedPostWithRepost: View {
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: UIImage(named: "profile_photo")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                
                
                Text("Михаил Вас...")
                    .font(Font.custom("VelaSans-Bold", size: 16))
                
                Image(uiImage: UIImage(named: "verify")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 19, height: 19)
                
                HStack {
                    Text("@mikhailva... · 3ч")
                        .opacity(0.4)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                    
                    Image(systemName: "ellipsis")
                        .opacity(0.4)
                }
                .contextMenu {
                    Button {
                                
                    } label: {
                        Label("Уведомлять о новых постах", systemImage: "speaker.wave.2.fill")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Добавить в избранное", systemImage: "heart.fill")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Скопировать ссылку", systemImage: "square.on.square")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Скрыть пост", systemImage: "eye.slash")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Отписаться", systemImage: "person.badge.minus")
                    }
                    
                    Button(role: .destructive) {
                                
                    } label: {
                        Label("Пожаловаться", systemImage: "exclamationmark.circle")
                    }
                    
                }
            }
            
            HStack {
                Text("Супер крутой пост, такие фотки красивые! Всем советую прочитать!")
                    .font(Font.custom("VelaSans-Regular", size: 14))
                    .frame(width: 300)
                    .padding(.leading, 25)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 291, height: 388)
                    .foregroundStyle(.black.opacity(0.1))
                    .cornerRadius(20)
                    .padding(.leading, 25)
                    .padding()
                
                VStack {
                    HStack {
                        Image(uiImage: UIImage(named: "photo_profile")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        
                        Text("Алина Калини...")
                            .font(Font.custom("VelaSans-Bold", size: 14))
                        
                        Image(uiImage: UIImage(named: "verify")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19, height: 19)
                        
                        Text("@alina... · 2ч")
                            .opacity(0.4)
                            .font(Font.custom("VelaSans-Regular", size: 14))
                        
                    }
                    .padding(.leading, 25)
                    
                    Text("Чтобы показать заказчику эскизы, нужно где-то найти тексты и картинки. Как правило, ни того, ни другого в момент показа эскизов у дизайнера нету. Что же делает...")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                        .frame(width: 250)
                        .padding(.leading, 20)
                        .padding(.top, 3)
                    
                    Spacer()
                    
                }
                .frame(width: 300, height: 350)
                
                Image(uiImage: UIImage(named: "Photo_post")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 291, height: 224)
                    .padding(.top, 165)
                    .padding(.leading, 25)
            }
            
            HStack {
                HStack {
                    Image(systemName: "heart")
                        .frame(width: 20, height: 20)
                    
                    Text("7")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 50)
                
                Spacer()
                
                HStack {
                    Image(systemName: "ellipsis.bubble")
                        .frame(width: 20, height: 20)
                    
                    Text("1")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 50)
                
                Spacer()
                
                HStack {
                    Image(systemName: "arrow.left.arrow.right")
                        .frame(width: 20, height: 20)
                    
                    Text("1")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 50)
                
                Spacer()
                
                HStack {
                    Image(systemName: "eye.fill")
                        .frame(width: 20, height: 20)
                    
                    Text("53")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 55)
                
            }
            .opacity(0.4)
            .frame(width: 300)
            .padding(.leading, 20)
            
        }
    }
}

#Preview {
    FeedPostWithRepost()
}
