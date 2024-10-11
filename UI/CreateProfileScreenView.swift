//
//  CreateProfileScreenView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct CreateProfileScreenView: View {
    
    @State var userName = ""
    @State var userSurname = ""
    @State var userInfo = ""
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            
            HStack {
                Text("Оформите профиль")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 55)
            .padding(.top, 30)
            
            HStack {
                Text("Расскажите нам и другим немного о себе. Эта\nинформация будет видна другим пользователям")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .font(Font.custom("SFProDisplay-Bold", size: 14))
                    .padding(.trailing, 0.1)
            }
            .padding(.trailing, 28)
            .padding(.top, 1)
            
            HStack {
                    TextField(
                        "Имя",
                        text: $userName)
                    .keyboardType(.numberPad)
                    .font(Font.custom("SFProDisplay-Medi", size: 16))
                    .foregroundColor(.gray.opacity(0.5))
                }
                .padding()
                .frame(width: 343, height: 54)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 60)
            
            HStack {
                    TextField(
                        "Фамилия",
                        text: $userSurname)
                    .keyboardType(.numberPad)
                    .font(Font.custom("SFProDisplay-Medi", size: 16))
                    .foregroundColor(.gray.opacity(0.5))
                }
                .padding()
                .frame(width: 343, height: 54)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 10)
            
            HStack {
                    TextField(
                        "О себе",
                        text: $userInfo)
                    .keyboardType(.numberPad)
                    .font(Font.custom("SFProDisplay-Medi", size: 16))
                    .foregroundColor(.gray.opacity(0.5))
                }
                .padding()
                .frame(width: 343, height: 54)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.top, 10)
                                      
            
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        .opacity((userName != "" && userSurname != "" && userInfo != "") ? 1 : 0.5)
                        
                    Text("Далее")
                        .foregroundColor(.white)
                        .bold()
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                }
            }
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

#Preview {
    CreateProfileScreenView()
}
