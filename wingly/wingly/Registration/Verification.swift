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
    
    @State var widthView = UIScreen.main.bounds.size.width
    @State var heightView = UIScreen.main.bounds.size.height
    
    @State var timer = 60
    @State var completion = {}
    
    var body: some View {
        if oneTimeCodeFields.loading {
            withAnimation(.default) {
                ProgressView()
            }
        } else {
            VStack {
                VStack(alignment: .leading, spacing: 40) {
                    largeLabel()
                        .padding(.top)
                        .padding(.top)
                        .padding(.top)
                        .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("verification-section-one-line-one")
                            .font(Font.custom("SFProDisplay-Medium", size: 16))
                            .foregroundColor(Color(hex: "bebebe"))
                            .padding(.leading)
                        Text("verification-section-one-line-two")
                            .font(Font.custom("SFProDisplay-Medium", size: 16))
                            .foregroundColor(Color(hex: "bebebe"))
                            .padding(.leading)
                    }
                    
                    VStack {
                        ZStack(alignment: .center) {
                            HStack(alignment: .center, spacing: widthView * 0.03) {
                                Spacer()
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: widthView * 0.13, height: widthView * 0.13)
                                        .foregroundColor(.white)
                                        .border(color: oneTimeCodeFields.otpField.count >= 1 ? .selectedItem : .unselectedItem)
                                    Text(oneTimeCodeFields.otp1)
                                        .foregroundColor(.gray)
                                }
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: widthView * 0.13, height: widthView * 0.13)
                                        .foregroundColor(.white)
                                        .border(color: oneTimeCodeFields.otpField.count >= 2 ? .selectedItem : .unselectedItem)
                                    Text(oneTimeCodeFields.otp2)
                                        .foregroundColor(.gray)
                                }
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: widthView * 0.13, height: widthView * 0.13)
                                        .foregroundColor(.white)
                                        .border(color: oneTimeCodeFields.otpField.count >= 3 ? .selectedItem : .unselectedItem)
                                    Text(oneTimeCodeFields.otp3)
                                        .foregroundColor(.gray)
                                }
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: widthView * 0.13, height: widthView * 0.13)
                                        .foregroundColor(.white)
                                        .border(color: oneTimeCodeFields.otpField.count >= 4 ? .selectedItem : .unselectedItem)
                                    Text(oneTimeCodeFields.otp4)
                                        .foregroundColor(.gray)
                                }
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: widthView * 0.13, height: widthView * 0.13)
                                        .foregroundColor(.white)
                                        .border(color: oneTimeCodeFields.otpField.count >= 5 ? .selectedItem : .unselectedItem)
                                    Text(oneTimeCodeFields.otp5)
                                        .foregroundColor(.gray)
                                }
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .frame(width: widthView * 0.13, height: widthView * 0.13)
                                        .foregroundColor(.white)
                                        .border(color: oneTimeCodeFields.otpField.count >= 6 ? .selectedItem : .unselectedItem)
                                    Text(oneTimeCodeFields.otp6)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            TextField("", text: $oneTimeCodeFields.otpField)
                                .frame(width: widthView * 0.93, height: widthView * 0.13)
                                .border(color: .selectedItem)
                                .font(Font.custom("SFProDisplay-Medium", size: 16))
                                .focused($focusedField, equals: 0)
                                .keyboardType(.numberPad)
                                .opacity(0)
                        }
                        .frame(height: widthView * 0.13)
                        Text("verification-section-two \(phoneNumber)")
                            .font(Font.custom("SFProDisplay-Medium", size: 18))
                            .foregroundColor(Color(hex: "bebebe"))
                            .padding(.top)
                        if timer > 0 {
                            Text("verification-section-three \(String(format:"%01i", timer / 60)):\(String(format:"%02i", timer % 60))")
                                .font(Font.custom("SFProDisplay-Bold", size: 18))
                                .foregroundColor(timer > 0 ? Color(hex: "bebebe") : .selectedItem)
                                .underline(timer == 0)
                        } else {
                            Button {
                                oneTimeCodeFields.otpField = ""
                                focusedField = oneTimeCodeFields.otpField.count
                                oneTimeCodeFields.verifyPhoneNumber(phoneNumber: phoneNumber)
                                startTimer()
                            } label: {
                                Text("verification-section-four")
                                    .font(Font.custom("SFProDisplay-Bold", size: 18))
                                    .foregroundColor(.selectedItem)
                                    .underline()
                            }
                        }
                    }
                }
                
                Spacer()
                
                loginButton()
                .padding(.bottom)
            }
            .onAppear {
                oneTimeCodeFields.otpField = ""
                focusedField = oneTimeCodeFields.otpField.count
                startTimer()
            }
        }
    }
    
    private func startTimer() {
        timer = 60
        Task {
            for _ in 0..<timer {
                timer -= 1
                try await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }
    
    private func largeLabel() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                Text("verification-heading-one")
                    .font(Font.custom("SFProDisplay-Bold", size: 34))
                Spacer()
            }
            HStack {
                Text("verification-heading-two")
                    .font(Font.custom("SFProDisplay-Bold", size: 34))
                Spacer()
            }
        }
    }
    
    private func loginButton() -> some View {
        return Button {
            if (oneTimeCodeFields.otpField.count == 6) {
                oneTimeCodeFields.verifyCode(phoneNumber: phoneNumber)
            }
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: widthView * 0.88, height: heightView / 15)
                    .cornerRadius(14)
                    .foregroundColor(oneTimeCodeFields.otpField.count == 6 ? .selectedItem : .unselectedItem)
                Text("verification-button")
                    .font(Font.custom("SFProDisplay-Bold", size: 18))
                    .foregroundColor(oneTimeCodeFields.otpField.count == 6 ? .white : .black)
            }
        }
    }
}

struct Verificationw_Previews: PreviewProvider {
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
