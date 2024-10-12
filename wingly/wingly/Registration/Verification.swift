//
//  Verification.swift
//  wingly
//
//  Created by Владимир Попов on 06.10.2024.
//

import SwiftUI

struct Verification: View {
    
    @FocusState private var focusedField: Int?
    
    @StateObject var oneTimeCodeFields: OneTimeCodeFields
    @State var phoneNumber: String
    
    @Environment(\.presentationMode) var present
    
    @State private var widthView = UIScreen.main.bounds.size.width
    @State private var heightView = UIScreen.main.bounds.size.height
    
    @State var timer = 30
    @State var completion = {}
    
    var body: some View {
        if oneTimeCodeFields.loading {
            withAnimation(.default) {
                ProgressView()
            }
        } else {
            VStack {
                Image("Logo_start")
                    .resizable()
                    .scaledToFit()
                    .padding(heightView * 0.054 / 5)
                    .frame(width: widthView, height: heightView * 0.054)
                
                Text("Введите код")
                    .font(Font.custom("VelaSans-Bold", size: 32))
                    .bold()
                    .frame(width: widthView * 0.91, alignment: .leading)
                    .padding(.top)
                    .padding(.bottom, heightView * 0.08)
                
                ZStack(alignment: .center) {
                    HStack(alignment: .center, spacing: widthView * 0.03) {
                        Spacer()
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: widthView * 0.13, height: widthView * 0.13)
                                .foregroundColor(.white)
                                .border(color: oneTimeCodeFields.otpField.count >= 1 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                            Text(oneTimeCodeFields.otp1)
                                .foregroundColor(.black)
                        }
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: widthView * 0.13, height: widthView * 0.13)
                                .foregroundColor(.white)
                                .border(color: oneTimeCodeFields.otpField.count >= 2 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                            Text(oneTimeCodeFields.otp2)
                                .foregroundColor(.black)
                        }
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: widthView * 0.13, height: widthView * 0.13)
                                .foregroundColor(.white)
                                .border(color: oneTimeCodeFields.otpField.count >= 3 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                            Text(oneTimeCodeFields.otp3)
                                .foregroundColor(.black)
                        }
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: widthView * 0.13, height: widthView * 0.13)
                                .foregroundColor(.white)
                                .border(color: oneTimeCodeFields.otpField.count >= 4 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                            Text(oneTimeCodeFields.otp4)
                                .foregroundColor(.black)
                        }
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: widthView * 0.13, height: widthView * 0.13)
                                .foregroundColor(.white)
                                .border(color: oneTimeCodeFields.otpField.count >= 5 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                            Text(oneTimeCodeFields.otp5)
                                .foregroundColor(.black)
                        }
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: widthView * 0.13, height: widthView * 0.13)
                                .foregroundColor(.white)
                                .border(color: oneTimeCodeFields.otpField.count >= 6 ? Color(hex: "865DE6") : Color(hex: "F6F6F6"))
                            Text(oneTimeCodeFields.otp6)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    TextField("", text: Binding(get: {
                        return oneTimeCodeFields.otpField
                    }, set: {
                        oneTimeCodeFields.otpField = $0
                        if (oneTimeCodeFields.otpField.count == 6) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                oneTimeCodeFields.verifyCode(phoneNumber: phoneNumber)
                            }
                        }
                    }))
                        .frame(width: widthView * 0.93, height: widthView * 0.13)
                        .border(color: .white)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                        .focused($focusedField, equals: 0)
                        .keyboardType(.numberPad)
                        .opacity(0)
                }
                .frame(height: widthView * 0.13)
                
                if timer <= 0 {
                    Button {
                        oneTimeCodeFields.otpField = ""
                        focusedField = oneTimeCodeFields.otpField.count
                        oneTimeCodeFields.verifyPhoneNumber(phoneNumber: phoneNumber)
                        startTimer()
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: widthView * 0.91, height: heightView * 0.066)
                                .cornerRadius(14)
                                .foregroundColor(.white)
                            
                            Text("Получить код повторно")
                                .font(Font.custom("VelaSans-Bold", size: 18))
                                .foregroundColor(Color(hex: "865DE6"))
                        }
                    }
                    .padding(.top)
                }
                
                Spacer()
            }
            .onAppear {
                oneTimeCodeFields.otpField = ""
                focusedField = oneTimeCodeFields.otpField.count
                startTimer()
            }
            .onDisappear {
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: { _, _ in }
                )
            }
        }
    }
    
    private func startTimer() {
        timer = 30
        Task {
            for _ in 0..<timer {
                timer -= 1
                try await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let test = OneTimeCodeFields()
            Verification(oneTimeCodeFields: test, phoneNumber: "+16505555634")
                .onAppear {
                    test.otpField = "987654"
                }
                .environment(\.locale, Locale.init(identifier: "ru"))
        }
    }
}
