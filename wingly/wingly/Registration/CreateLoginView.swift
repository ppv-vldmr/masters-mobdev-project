//
//  CreateLoginView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct CreateLoginView: View {
    
    @State private var widthView = UIScreen.main.bounds.size.width
    @State private var heightView = UIScreen.main.bounds.size.height
    
    @FocusState private var focusedTextfield: Bool?
    
    @State private var userLogin = ""
    
    @State private var registeredLogins: Set<String>?
    @State private var observerID: UInt?
    
    @State private var loginExists = false
    @State private var loginHasWrongSymbols = false
    
    var body: some View {
        VStack {
            Image("Logo_start")
                .resizable()
                .scaledToFit()
                .padding(heightView * 0.054 / 5)
                .frame(width: widthView, height: heightView * 0.054)
            
            Text("Как вас называть?")
                .font(Font.custom("VelaSans-Bold", size: 32))
                .bold()
                .frame(width: widthView * 0.91, alignment: .leading)
                .padding(.top)
                .padding(.bottom, heightView * 0.01)
            
            Text("Ваше имя является уникальным. Его можно\nизменить в любое время в настройках")
                .foregroundColor(.gray)
                .opacity(0.5)
                .font(Font.custom("VelaSans-Regular", size: 14))
                .frame(width: widthView * 0.91, alignment: .leading)
                .padding(.bottom, heightView * 0.08)
            
            HStack {
                TextField(focusedTextfield ?? false ? "@" : "@yournickname", text: Binding(get: {
                    return userLogin
                }, set: {
                    userLogin = ($0.starts(with: "@") ? "" : "@") + $0.replacingOccurrences(of: " ", with: "")
                }))
                .keyboardType(.asciiCapable)
                .font(Font.custom("VelaSans-Regular", size: 16))
                .foregroundColor(focusedTextfield ?? false ? .black : .gray.opacity(0.5))
                .focused($focusedTextfield, equals: true)
            }
            .padding()
            .frame(width: widthView * 0.91)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(userLogin.count >= 4 && (registeredLogins?.contains(userLogin) ?? false) ? Color(hex: "ED2A2A") : .gray.opacity(0.5), lineWidth: 1)
            )
            
            Text("Такое имя уже существует")
                .foregroundStyle(Color(hex: "ED2A2A"))
                .font(Font.custom("VelaSans-Regular", size: 14))
                .frame(width: widthView * 0.91, alignment: .leading)
                .padding(.vertical, heightView * 0.01)
                .opacity(userLogin.count >= 4 && (registeredLogins?.contains(userLogin) ?? false) ? 1 : 0)
                                      
            
            Button {
                DatabaseManager.shared.saveLogin(userLogin)
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: widthView * 0.91, height: heightView * 0.066)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        .opacity(userLogin.count < 4 || (registeredLogins?.contains(userLogin) ?? true) ? 0.5 : 1)
                        
                    Text("Далее")
                        .foregroundColor(.white)
                        .bold()
                        .font(Font.custom("VelaSans-Bold", size: 16))
                }
            }
            .disabled(userLogin.count < 4 || (registeredLogins?.contains(userLogin) ?? true))
            
            Spacer()
        }
        .onAppear {
            focusedTextfield = true
            observerID = DatabaseManager.shared.getAllRegisteredLogins(
                onSuccess: { logins in
                    self.registeredLogins = logins
                },
                onError: {
                    print("Failed to update registered logins")
                }
            )
        }
        .onDisappear {
            if observerID != nil {
                DatabaseManager.shared.removeRegisteredLoginsObserver(id: observerID!)
            }
        }
        .autocorrectionDisabled(true)
    }
}

#Preview {
    CreateLoginView()
}
