//
//  InterestsOnboardingView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct InterestsOnboardingView: View {
    
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
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            
            HStack {
                Text("Выберите, что вам\nинтересно")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 55)
            .padding(.top, 30)
            
            HStack {
                Text("Выберите минимум 3 категории")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .font(Font.custom("SFProDisplay-Bold", size: 14))
                    .padding(.trailing, 15)
            }
            .padding(.trailing, 110)
            .padding(.top, 1)
            
            HStack {
                Button {
                    self.didTap1 = true
                } label: {
                    Text("Мода и красота")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap1 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap2 = true
                } label: {
                    Text("Животные")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap2 ? Color(red: 254 / 255, green: 200 / 255, blue: 120 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap3 = true
                } label: {
                    Text("Игры")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap3 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 40)
            
            HStack {
                Button {
                    self.didTap4 = true
                } label: {
                    Text("Транспорт")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap4 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap5 = true
                } label: {
                    Text("Еда и напитки")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap5 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap6 = true
                } label: {
                    Text("Бизнес")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap6 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap7 = true
                } label: {
                    Text("Искусство")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap7 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap8 = true
                } label: {
                    Text("Технологии")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap8 ? Color(red: 175 / 255, green: 237 / 255, blue: 223 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap9 = true
                } label: {
                    Text("Дом и сад")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap9 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap10 = true
                } label: {
                    Text("Наука")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap10 ? Color(red: 254 / 255, green: 200 / 255, blue: 120 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap11 = true
                } label: {
                    Text("Путешествия")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap11 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap12 = true
                } label: {
                    Text("Отношения")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap12 ? Color(red: 254 / 255, green: 200 / 255, blue: 120 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap13 = true
                } label: {
                    Text("Фильмы и ТВ")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap13 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap14 = true
                } label: {
                    Text("Спорт")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap14 ? Color(red: 226 / 255, green: 255 / 255, blue: 159 / 255).opacity(0.8) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
                
                Button {
                    self.didTap15 = true
                } label: {
                    Text("Образование")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.black)
                        .padding()
                        .background(didTap15 ? Color(red: 173 / 255, green: 139 / 255, blue: 253 / 255).opacity(0.6) : .gray.opacity(0.1))
                        .cornerRadius(14)
                }
            }
            .padding(.top, 2)
            
            HStack {
                Button {
                    self.didTap16 = true
                } label: {
                    Text("Развлечения")
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
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
            
            HStack {
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
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                        .foregroundStyle(.purple)
                }
            }
            .padding(.bottom, 20)
            
            Button {
                self.didTap16 = true
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        
                    Text("Далее")
                        .foregroundColor(.white)
                        .bold()
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                }
            }
            .padding(.bottom, 20)
            
            
            
        }
    }
}

#Preview {
    InterestsOnboardingView()
}
