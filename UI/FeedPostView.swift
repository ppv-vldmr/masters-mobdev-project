//
//  FeedPostView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 12.10.2024.
//

import SwiftUI

struct FeedPostView: View {
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: UIImage(named: "profile_photo")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                
                
                Text("Михаил Васи...")
                
                Image(uiImage: UIImage(named: "verify")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 19, height: 19)
                
                Text("@mikhailvas... · 3ч")
                    .opacity(0.4)
                
                Image(systemName: "ellipsis")
                    .opacity(0.4)
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
                    .font(Font.custom("SFProDisplay-Bold", size: 14))
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
                        
                        
                        Text("Алина Ка...")
                        
                        Image(uiImage: UIImage(named: "verify")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19, height: 19)
                        
                        Text("@alina... · 2ч")
                            .opacity(0.4)
                        
                    }
                    .padding(.leading, 25)
                    
                    Text("Чтобы показать заказчику эскизы, нужно где-то найти тексты и картинки. Как правило, ни того, ни другого в момент показа эскизов у дизайнера нету. Что же делает диз...")
                        .font(Font.custom("SFProDisplay-Bold", size: 14))
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
                    .padding(.top, 160)
                    .padding(.leading, 25)
            }
        }
    }
}

#Preview {
    FeedPostView()
}
