//
//  VerificationCodeView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    
    @State var codeSection1 = ""
    @State var codeSection2 = ""
    @State var codeSection3 = ""
    @State var codeSection4 = ""
    @State var codeSection5 = ""
    @State var codeSection6 = ""
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            
            HStack {
                Text("Введите код")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 145)
            .padding(.top, 30)
            
            
            HStack(spacing: 15) {
                HStack {
                        TextField(
                            "0",
                            text: $codeSection1)
                        .keyboardType(.numberPad)
                        .font(Font.custom("SFProDisplay-Medi", size: 16))
                        .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(width: 45, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
                    
                HStack {
                        TextField(
                            "0",
                            text: $codeSection2)
                        .keyboardType(.numberPad)
                        .font(Font.custom("SFProDisplay-Medi", size: 16))
                        .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(width: 45, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
                
                HStack {
                        TextField(
                            "0",
                            text: $codeSection3)
                        .keyboardType(.numberPad)
                        .font(Font.custom("SFProDisplay-Medi", size: 16))
                        .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(width: 45, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
                
                HStack {
                        TextField(
                            "0",
                            text: $codeSection4)
                        .keyboardType(.numberPad)
                        .font(Font.custom("SFProDisplay-Medi", size: 16))
                        .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(width: 45, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
                
                HStack {
                        TextField(
                            "0",
                            text: $codeSection5)
                        .keyboardType(.numberPad)
                        .font(Font.custom("SFProDisplay-Medi", size: 16))
                        .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(width: 45, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
                
                HStack {
                        TextField(
                            "0",
                            text: $codeSection6)
                        .keyboardType(.numberPad)
                        .font(Font.custom("SFProDisplay-Medi", size: 16))
                        .foregroundColor(.gray.opacity(0.5))
                    }
                    .padding()
                    .frame(width: 45, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
            }
            .padding(.top, 60)
            
                                      
            
            Spacer()
            
            HStack {
                Text("Получить код повторно")
                    .font(Font.custom("SFProDisplay-Bold", size: 16))
                    .foregroundStyle(.purple)
            }
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    VerificationCodeView()
}
