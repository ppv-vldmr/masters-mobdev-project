//
//  NotifyView.swift
//  wingly
//
//  Created by Владимир Попов on 22.11.2024.
//

import SwiftUI

struct NotifyView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var heightView = UIScreen.main.bounds.height
    @State private var widthView = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                Image("wingly_logo_notify")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                Text("Подтвердите свой профиль и получите звезду верификации!")
                Spacer()
            }
            .padding(.top)
            
            Rectangle()
                .frame(width: widthView * 0.85, height: 1)
                .foregroundStyle(.black)
                .opacity(0.1)
            
            VStack {
                
                HStack {
                    Image("photo_profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("**alinakarp** нравится ваш комментарий. ") +
                    Text("3 с")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Image("profile_photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("**mikhailvasilev** нравится ваш комментарий. ") +
                    Text("5 мин")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Image("profile_photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("**mikhailvasilev** нравится ваш пост. ") +
                    Text("30 мин")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Image("photo_profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("**alinakarp** нравится ваш пост. ") +
                    Text("7 часов")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Image("photo_profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("**alinakarp** сделал(-а) репост вашего поста. ") +
                    Text("3 дня")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Image("profile_photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text("**mikhailvasilev** нравится ваш комментарий. ") +
                    Text("5 дней")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                }
            }
            .frame(height: heightView * 0.47)
            
            Spacer()
        }
        .frame(width: widthView * 0.9, height: heightView * 0.85)
        .navigationTitle("Уведомления")
        .toolbarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NotifyView()
}
