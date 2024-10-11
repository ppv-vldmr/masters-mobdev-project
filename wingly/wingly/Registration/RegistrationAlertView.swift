//
//  RegistrationAlertView.swift
//  wingly
//
//  Created by Владимир Попов on 06.10.2024.
//

import SwiftUI

struct AlertView: View {
    
    var msg: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Error")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Text(msg)
                .foregroundColor(.gray)
            
            Button {
                show.toggle()
            } label: {
                Text("Close")
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color("yellow"))
                    .cornerRadius(15)
            }
            .frame(alignment: .center)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal, 25)
        
        // background dim...
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

#Preview {
    AlertView(msg: "Test error", show: .constant(true))
}
