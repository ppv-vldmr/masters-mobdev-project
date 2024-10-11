//
//  PhoneEnterView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct PhoneEnterView: View {
    
    @State var phoneNumber = ""
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            
            HStack {
                Text("Введите номер\nтелефона")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 120)
            .padding(.top, 50)
            
            HStack {
                    TextField(
                        "+7 (999) 999-99-99",
                        text: $phoneNumber)
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
                        .opacity(phoneNumber == "" ? 0.5 : 1)
                        
                    Text("Получить код")
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
    PhoneEnterView()
}
