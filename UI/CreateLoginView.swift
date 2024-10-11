//
//  CreateLoginView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct CreateLoginView: View {
    
    @State var userLogin = ""
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            
            HStack {
                Text("Как вас называть?")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 55)
            .padding(.top, 30)
            
            HStack {
                Text("Ваше имя является уникальным. Его можно\nизменить в любое время в настройках")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .font(Font.custom("SFProDisplay-Bold", size: 14))
                    .padding(.trailing, 15)
            }
            .padding(.trailing, 28)
            .padding(.top, 1)
            
            HStack {
                    TextField(
                        "@yournickname",
                        text: $userLogin)
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
                                      
            
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        .opacity(userLogin == "" ? 0.5 : 1)
                        
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
    CreateLoginView()
}
