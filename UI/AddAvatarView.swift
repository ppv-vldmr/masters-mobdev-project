//
//  AddAvatarView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct AddAvatarView: View {
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            
            HStack {
                Text("Добавьте аватарку")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 55)
            .padding(.top, 30)
            
            HStack {
                Text("Загрузите свое фото. Оно будет видно другим\nпользователям")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .font(Font.custom("SFProDisplay-Bold", size: 14))
                    .padding(.trailing, 8)
            }
            .padding(.trailing, 28)
            .padding(.top, 1)
            
              
            ZStack {
                Rectangle()
                    .frame(width: 343, height: 343)
                    .cornerRadius(343 / 2)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 343 / 2)
                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                    )
                
                Image(uiImage: UIImage(named: "plus_photo_reg")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 136, height: 136)
                    .foregroundColor(.gray.opacity(0.5))
            }
            .padding(.top, 30)
            
            
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        
                    Text("Сохранить")
                        .foregroundColor(.white)
                        .bold()
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                }
            }
            .padding(.top, 30)
            
            
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(.black, lineWidth: 1)
                        )
                        
                    Text("Пропустить")
                        .foregroundColor(.black)
                        .bold()
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                }
            }
            .padding(.top, 10)
            
            Spacer()
        }
    }
}

#Preview {
    AddAvatarView()
}
