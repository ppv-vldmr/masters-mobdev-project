//
//  AddAvatarView.swift
//  univer_dev
//
//  Created by Лиза Плисюк on 06.10.2024.
//

import SwiftUI

struct AddAvatarView: View {
    
    @State private var widthView = UIScreen.main.bounds.size.width
    @State private var heightView = UIScreen.main.bounds.size.height
    
    @State private var showPhotoLibrary = false
    @State private var selectedImage: UIImage = UIImage()
    
    @State private var showInterests = false
    
    var body: some View {
        if showInterests {
            InterestsOnboardingView()
        } else {
            VStack {
                Image("Logo_start")
                    .resizable()
                    .scaledToFit()
                    .padding(heightView * 0.054 / 5)
                    .frame(width: widthView, height: heightView * 0.054)
                
                Text("Добавьте аватарку")
                    .font(Font.custom("VelaSans-Bold", size: 32))
                    .bold()
                    .frame(width: widthView * 0.91, alignment: .leading)
                
                Text("Загрузите свое фото. Оно будет видно другим\nпользователям")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .font(Font.custom("VelaSans-Regular", size: 14))
                    .frame(width: widthView * 0.91, alignment: .leading)
                
                if selectedImage == UIImage() {
                    Button {
                        showPhotoLibrary = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: widthView * 0.91, height: widthView * 0.91)
                                .cornerRadius(widthView * 0.91 / 2)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: widthView * 0.91 / 2)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                )
                            
                            Image("plus_photo_reg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: widthView * 0.33, height: widthView * 0.33)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                        .padding(.top, heightView * 0.03)
                    }
                    .disabled(selectedImage != UIImage())
                } else {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: widthView * 0.91, height: widthView * 0.91)
                        .clipShape(Circle())
                        .padding(.top, heightView * 0.03)
                }
                
                Button {
                    DatabaseManager.shared.saveAvatar(selectedImage)
                    showInterests = true
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: widthView * 0.91, height: heightView * 0.066)
                            .cornerRadius(14)
                            .foregroundColor(.black)
                            .opacity(selectedImage == UIImage() ? 0.5 : 1)
                        
                        Text("Сохранить")
                            .foregroundColor(.white)
                            .font(Font.custom("VelaSans-Bold", size: 16))
                    }
                }
                .padding(.top, heightView * 0.03)
                .disabled(selectedImage == UIImage())
                
                if selectedImage == UIImage() {
                    Button {
                        showInterests = true
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: widthView * 0.91, height: heightView * 0.066)
                                .cornerRadius(14)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(.black, lineWidth: 1)
                                )
                            
                            Text("Пропустить")
                                .foregroundColor(.black)
                                .font(Font.custom("VelaSans-Bold", size: 16))
                        }
                    }
                    .padding(.top, heightView * 0.01)
                } else {
                    Button {
                        showPhotoLibrary = true
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: widthView * 0.91, height: heightView * 0.066)
                                .cornerRadius(14)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(.black, lineWidth: 1)
                                )
                            
                            Text("Заменить фотографию")
                                .foregroundColor(.black)
                                .font(Font.custom("VelaSans-Bold", size: 16))
                        }
                    }
                    .padding(.top, heightView * 0.01)
                }
                
                Spacer()
            }
            .fullScreenCover(isPresented: $showPhotoLibrary, onDismiss: { showPhotoLibrary = false }, content: {
                PhotoPicker(selectedImage: $selectedImage)
                    .ignoresSafeArea()
            })
        }
    }
}

#Preview {
    AddAvatarView()
}
