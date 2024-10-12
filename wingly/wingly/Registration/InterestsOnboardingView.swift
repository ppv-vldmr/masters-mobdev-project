//
//  InterestsOnboardingView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct InterestsOnboardingView: View {
    
    @AppStorage("is_newbie") var isNewbie = false
    
    @State private var widthView = UIScreen.main.bounds.size.width
    @State private var heightView = UIScreen.main.bounds.size.height
    
    @State private var didTap1 :Bool = false
    @State private var didTap2 :Bool = false
    @State private var didTap3 :Bool = false
    @State private var didTap4 :Bool = false
    @State private var didTap5 :Bool = false
    @State private var didTap6 :Bool = false
    @State private var didTap7 :Bool = false
    @State private var didTap8 :Bool = false
    @State private var didTap9 :Bool = false
    @State private var didTap10 :Bool = false
    @State private var didTap11 :Bool = false
    @State private var didTap12 :Bool = false
    @State private var didTap13 :Bool = false
    @State private var didTap14 :Bool = false
    @State private var didTap15 :Bool = false
    @State private var didTap16 :Bool = false
    
    var body: some View {
        VStack {
            Image("Logo_start")
                .resizable()
                .scaledToFit()
                .padding(heightView * 0.054 / 5)
                .frame(width: widthView, height: heightView * 0.054)
            
            
            Text("Выберите, что вам\nинтересно")
                .font(Font.custom("VelaSans-Bold", size: 32))
                .frame(width: widthView * 0.91, alignment: .leading)
            
            Text("Выберите минимум 3 категории")
                .foregroundColor(.gray)
                .opacity(0.5)
                .font(Font.custom("VelaSans-Regular", size: 14))
                .frame(width: widthView * 0.91, alignment: .leading)
            
            HStack {
                Button {
                    self.didTap1.toggle()
                } label: {
                    Text("Мода и красота")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap1 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap2.toggle()
                } label: {
                    Text("Животные")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap2 ? Color(red: 254 / 255, green: 200 / 255, blue: 120 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap3.toggle()
                } label: {
                    Text("Игры")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap3 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 40)
            
            HStack {
                Button {
                    self.didTap4.toggle()
                } label: {
                    Text("Транспорт")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap4 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap5.toggle()
                } label: {
                    Text("Еда и напитки")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap5 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap6.toggle()
                } label: {
                    Text("Бизнес")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap6 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap7.toggle()
                } label: {
                    Text("Искусство")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap7 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap8.toggle()
                } label: {
                    Text("Технологии")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap8 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap9.toggle()
                } label: {
                    Text("Дом и сад")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap9 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap10.toggle()
                } label: {
                    Text("Наука")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap10 ? Color(red: 254 / 255, green: 200 / 255, blue: 120 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap11.toggle()
                } label: {
                    Text("Путешествия")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap11 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap12.toggle()
                } label: {
                    Text("Отношения")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap12 ? Color(red: 254 / 255, green: 200 / 255, blue: 120 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap13.toggle()
                } label: {
                    Text("Фильмы и ТВ")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap13 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap14.toggle()
                } label: {
                    Text("Спорт")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap14 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap15.toggle()
                } label: {
                    Text("Образование")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap15 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap16.toggle()
                } label: {
                    Text("Развлечения")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap16 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                Spacer()
            }
            .padding(.top, 2)
            .padding(.leading, 20)
                                      
            Spacer()
            
            Button {
                self.didTap1 = true
                self.didTap2 = true
                self.didTap3 = true
                self.didTap4 = true
                self.didTap5 = true
                self.didTap6 = true
                self.didTap7 = true
                self.didTap8 = true
                self.didTap9 = true
                self.didTap10 = true
                self.didTap11 = true
                self.didTap12 = true
                self.didTap13 = true
                self.didTap14 = true
                self.didTap15 = true
                self.didTap16 = true
            } label: {
                Text("Выбрать все")
                    .font(Font.custom("VelaSans-Bold", size: 16))
                    .foregroundStyle(Color(hex: "865DE6"))
                    .frame(width: widthView * 0.91, height: heightView * 0.066)
            }
            
            Button {
                isNewbie = false
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: widthView * 0.91, height: heightView * 0.066)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        
                    Text("Далее")
                        .foregroundColor(.white)
                        .bold()
                        .font(Font.custom("VelaSans-Bold", size: 16))
                }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    InterestsOnboardingView()
}
