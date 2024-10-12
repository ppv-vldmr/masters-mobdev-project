//
//  DatabaseManager.swift
//  wingly
//
//  Created by Владимир Попов on 12.10.2024.
//

import Foundation
import SwiftUI
import FirebaseDatabase

class DatabaseManager: ObservableObject {
    
    static let shared = DatabaseManager()
    
    @AppStorage("log_Status") var status = false
    @AppStorage("is_newbie") var isNewbie = false
    @AppStorage("user_login") var userLogin = ""
    @AppStorage("phone_number") var phoneNumber = ""
    
    func writeUserPhoneToDatabase(phone: String) {
        
        var isLoggedAgain = false
        
        Database.database().reference().child("phone_numbers").child(phone).runTransactionBlock({ (phoneNumbersSnapshot: MutableData) -> TransactionResult in
            
            if let _ = phoneNumbersSnapshot.value as? Double {
                isLoggedAgain = true
            } else {
                phoneNumbersSnapshot.value = Date().timeIntervalSince1970
            }
            
            return TransactionResult.success(withValue: phoneNumbersSnapshot)
        }) { registrationError, committed, snapshot in
            if registrationError != nil {
                print("Error saving user' phone number: \(registrationError!.localizedDescription).")
            } else {
                print("Users phone number saved, user successfully logged in\(isLoggedAgain ? " again" : "").")
                self.isNewbie = !isLoggedAgain
                self.status = true
                self.phoneNumber = phone
            }
        }
    }
    
    func getAllRegisteredLogins(
        onSuccess: @escaping (Set<String>) -> Void,
        onError: @escaping () -> Void
    ) -> UInt {
        return Database.database().reference().child("logins").observe(.value) { allLoginsSnapshot in
            guard allLoginsSnapshot.exists() else {
                onSuccess([])
                return
            }
            guard let loginsRaw = allLoginsSnapshot.value as? [String : Any] else {
                onError()
                return
            }
            let logins = Set(loginsRaw.keys)
            onSuccess(logins)
        }
    }
    
    func removeRegisteredLoginsObserver(id: UInt) {
        Database.database().reference().removeObserver(withHandle: id)
    }
    
    func saveLogin(_ login: String) {
        userLogin = login
        Database.database().reference().child("logins").child(login).setValue(phoneNumber)
    }
    
    func saveUserProfileDate(name: String, surname: String, info: String) {
        if !userLogin.isEmpty {
            Database.database().reference().child("profiles").child(userLogin).child("name").setValue(name)
            Database.database().reference().child("profiles").child(userLogin).child("surname").setValue(surname)
            Database.database().reference().child("profiles").child(userLogin).child("info").setValue(info)
        }
    }
}
