//
//  SettingsView.swift
//  wingly
//
//  Created by Владимир Попов on 23.11.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var heightView = UIScreen.main.bounds.height
    @State private var widthView = UIScreen.main.bounds.width
    
    @State private var themeChange = false
    
    var body: some View {
        VStack {
            ScrollView {
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("settings_1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17)
                    
                    Spacer()
                    
                    Text("**Учетная запись**\n") +
                    Text("Сведения учетной записи, интересы, подтверждение профиля")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 17)
                }
                .padding(.top)
                
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("settings_2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Text("**Светлая тема**")
                    
                    Spacer()
                    
                    Toggle("", isOn: $themeChange)
                }
                .padding(.top)
                .frame(width: widthView * 0.9)
                
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("settings_3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Text("**Конфиденциальность**")
            
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 17)
                }
                .padding(.top)
                
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Text("**Уведомления**")
            
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 17)
                }
                .padding(.top)
                
                
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("settings_4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Text("**Заблокированные аккаунты**")
            
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 17)
                }
                .padding(.top)
                
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("settings_6")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Text("**Аккаунты с ограничениями**")
            
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 17)
                }
                .padding(.top)
                
                Rectangle()
                    .frame(width: widthView * 0.85, height: 1)
                    .foregroundStyle(.black)
                    .opacity(0.1)
                    .padding(.top)
                
                HStack {
                    Image("settings_7")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 27)
                    
                    
                    Text("**Условия сервиса Wingly**\n") +
                    Text("Условия сервиса и Политика конфиденциальности")
                        .foregroundStyle(.black.opacity(0.4))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 17)
                }
                .padding(.top)
                
                HStack {
                    Text("**Выйти**")
                        .padding(.top)
                        .foregroundStyle(Color(red: 134 / 255, green: 93 / 255, blue: 230 / 255))
                    
                    Spacer()
                }
                
                HStack {
                    Text("**Удалить аккаунт**")
                        .padding(.top)
                        .foregroundStyle(Color(red: 237 / 255, green: 42 / 255, blue: 42 / 255))
                    
                    Spacer()
                }
                
                Rectangle()
                    .frame(height: 60)
                    .opacity(0)
            }
            .frame(width: widthView * 0.9)
            .scrollIndicators(.hidden)
            
        }
        .frame(height: heightView * 0.85)
        .navigationTitle("Настройки")
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
    SettingsView()
}
