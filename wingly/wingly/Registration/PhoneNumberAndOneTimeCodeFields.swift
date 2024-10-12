//
//  PhoneNumberAndOneTimeCodeFields.swift
//  wingly
//
//  Created by Владимир Попов on 06.10.2024.
//

import Foundation
import SwiftUI
import FirebaseAuth

class OneTimeCodeFields: ObservableObject {
    @AppStorage("log_Status") var status = false
    
    @Published var phoneCode = ""
    
    @Published var loading = false
    
    @Published var error = false
    @Published var errorMsg = ""
    
    @Published var otpField = "" {
        didSet {
            guard otpField.count <= 6, otpField.last?.isNumber ?? true else {
                otpField = oldValue
                return
            }
        }
    }
    
    var otp1: String {
        return checkConstraints(index: 1) ? String(Array(otpField)[0]) : ""
    }
    var otp2: String {
        return checkConstraints(index: 2) ? String(Array(otpField)[1]) : ""
    }
    var otp3: String {
        return checkConstraints(index: 3) ? String(Array(otpField)[2]) : ""
    }
    var otp4: String {
        return checkConstraints(index: 4) ? String(Array(otpField)[3]) : ""
    }
    
    var otp5: String {
        return checkConstraints(index: 5) ? String(Array(otpField)[4]) : ""
    }
    
    var otp6: String {
        return checkConstraints(index: 6) ? String(Array(otpField)[5]) : ""
    }
    
    private func checkConstraints(index: Int) -> Bool {
        return otpField.count >= index
    }
    
    func verifyPhoneNumber(phoneNumber: String) {
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { code, err in
            if let error = err {
                self.errorMsg = error.localizedDescription
                withAnimation {
                    
                    self.otpField = ""
                    self.error.toggle()
                }
                return
            }
            self.phoneCode = code ?? ""
        }
    }
    
    func verifyCode(phoneNumber: String) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.phoneCode, verificationCode: otpField)
        
        loading = true
        
        Auth.auth().signIn(with: credential) { result, err in
            self.loading = false
            if let error = err{
                self.errorMsg = error.localizedDescription
                withAnimation {
                    self.error.toggle()
                }
                return
            }

            withAnimation{
                self.status = true
            }
            
            do {
                let encodedData = try NSKeyedArchiver.archivedData(withRootObject: credential, requiringSecureCoding: false)
                let defaults = UserDefaults(suiteName: "group.itmo.masters.wingly")!
                defaults.setValue(encodedData, forKey: "credential")
                defaults.setValue(phoneNumber, forKey: "phoneNumber")
                
//                DatabaseManager.writeUserPhoneToDatabase(phoneNumber: phoneNumber)
            } catch {
                print("Failed to save user credentials")
            }
        }
    }
}
