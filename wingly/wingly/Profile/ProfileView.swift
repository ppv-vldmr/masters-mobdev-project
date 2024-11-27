//
//  ProfileView.swift
//  wingly
//
//  Created by Владимир Попов on 09.11.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var widthView = UIScreen.main.bounds.width
    @State private var heightView = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    HStack {
                        Image("photo_profile_main")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 120)
                        
                        VStack {
                            Text("20")
                                .font(Font.custom("VelaSans-Bold", size: 17))
                            Text("Постов")
                                .font(Font.custom("VelaSans-Regular", size: 13))
                        }
                        .padding(.leading, 20)
                        
                        VStack {
                            Text("24")
                                .font(Font.custom("VelaSans-Bold", size: 17))
                            Text("Подписчиков")
                                .font(Font.custom("VelaSans-Regular", size: 13))
                        }
                        .padding(.leading, 5)
                        
                        VStack {
                            Text("21")
                                .font(Font.custom("VelaSans-Bold", size: 17))
                            Text("Подписок")
                                .font(Font.custom("VelaSans-Regular", size: 13))
                        }
                        .padding(.leading, 5)
                    }
                    
                    HStack {
                        Text("Марк Зайцев")
                            .font(Font.custom("VelaSans-Bold", size: 32))
                        Spacer()
                        
                    }
                    .frame(width: widthView)
                    .padding(.leading, 20)
                    
                    HStack {
                        Text("@markzayats")
                            .font(Font.custom("VelaSans-Regular", size: 16))
                            .foregroundStyle(Color(hex: "865DE6"))
                        Spacer()
                        
                    }
                    .frame(width: widthView)
                    .padding(.leading, 20)
                    
                    HStack {
                        Text("Фотограф, дизайнер и музыкант")
                            .font(Font.custom("VelaSans-Regular", size: 16))
                        Spacer()
                        
                    }
                    .frame(width: widthView)
                    .padding(.leading, 20)
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 40)
                                .cornerRadius(12)
                            Text("Редактировать профиль")
                                .font(Font.custom("VelaSans-Regular", size: 16))
                                .foregroundStyle(.white)
                        }
                        
                    }
                    
                    ProfilePostView()
                    
                    Rectangle()
                        .frame(height: 55)
                        .opacity(0)
                }
                .scrollIndicators(.hidden)
                .frame(height: heightView * 0.82)
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image("Logo_start")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.leading, 140)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(uiImage: UIImage(named: "gear")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
