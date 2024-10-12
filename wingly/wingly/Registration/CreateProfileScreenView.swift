//
//  CreateProfileScreenView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct CreateProfileScreenView: View {
    
    @State private var widthView = UIScreen.main.bounds.size.width
    @State private var heightView = UIScreen.main.bounds.size.height
    
    @State private var userName = ""
    @State private var userSurname = ""
    @State private var userInfo = ""
    
    @State private var showAvatarSettings = false
    
    var body: some View {
        if showAvatarSettings {
            AddAvatarView()
        } else {
            VStack {
                Image("Logo_start")
                    .resizable()
                    .scaledToFit()
                    .padding(heightView * 0.054 / 5)
                    .frame(width: widthView, height: heightView * 0.054)
                
                Text("Оформите профиль")
                    .font(Font.custom("VelaSans-Bold", size: 32))
                    .bold()
                    .frame(width: widthView * 0.91, alignment: .leading)
                    .padding(.vertical)
                
                Text("Расскажите нам и другим немного о себе. Эта\nинформация будет видна другим пользователям")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .font(Font.custom("VelaSans-Regular", size: 14))
                    .frame(width: widthView * 0.91, alignment: .leading)
                
                HStack {
                    TextField("Имя", text: $userName)
                        .keyboardType(.asciiCapable)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                        .foregroundColor(userName.isEmpty ? .gray.opacity(0.5) : .black)
                }
                .padding()
                .frame(width: widthView * 0.91)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, heightView * 0.05)
                
                HStack {
                    TextField("Фамилия", text: $userSurname)
                        .keyboardType(.asciiCapable)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                        .foregroundColor(userSurname.isEmpty ? .gray.opacity(0.5) : .black)
                }
                .padding()
                .frame(width: widthView * 0.91)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, heightView * 0.01)
                
                HStack {
                    TextField("О себе", text: $userInfo)
                        .keyboardType(.asciiCapable)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                        .foregroundColor(userInfo.isEmpty ? .gray.opacity(0.5) : .black)
                }
                .padding()
                .frame(width: widthView * 0.91)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, heightView * 0.01)
                
                Button {
                    DatabaseManager.shared.saveUserProfileDate(name: userName, surname: userSurname, info: userInfo)
                    showAvatarSettings = true
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: widthView * 0.91, height: heightView * 0.066)
                            .cornerRadius(14)
                            .foregroundColor(.black)
                            .opacity((userName != "" && userSurname != "" && userInfo != "") ? 1 : 0.5)
                        
                        Text("Далее")
                            .foregroundColor(.white)
                            .bold()
                            .font(Font.custom("VelaSans-Bold", size: 16))
                    }
                }
                .padding(.top, heightView * 0.05)
                .disabled(userName.isEmpty || userSurname.isEmpty || userInfo.isEmpty)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CreateProfileScreenView()
}
