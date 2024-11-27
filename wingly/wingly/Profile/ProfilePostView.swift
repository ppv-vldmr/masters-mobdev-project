//
//  ProfilePostView.swift
//  wingly
//
//  Created by Владимир Попов on 09.11.2024.
//

import SwiftUI

struct ProfilePostView: View {
    
    @State var isReadMoreTap :Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: UIImage(named: "photo_profile_main")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                
                
                Text("Марк Зай...")
                    .font(Font.custom("VelaSans-Bold", size: 16))
                
                Image(uiImage: UIImage(named: "verify")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 19, height: 19)
                
                
                
                HStack {
                    Text("@markzayats... · 3д")
                        .opacity(0.4)
                        .font(Font.custom("VelaSans-Regular", size: 16))
                    
                    Image(systemName: "ellipsis")
                        .opacity(0.4)
                }
                .contextMenu {
                    Button {
                                
                    } label: {
                        Label("Уведомлять о новых постах", systemImage: "speaker.wave.2.fill")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Добавить в избранное", systemImage: "heart.fill")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Скопировать ссылку", systemImage: "square.on.square")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Скрыть пост", systemImage: "eye.slash")
                    }
                    
                    Button {
                                
                    } label: {
                        Label("Отписаться", systemImage: "person.badge.minus")
                    }
                    
                    Button(role: .destructive) {
                                
                    } label: {
                        Label("Пожаловаться", systemImage: "exclamationmark.circle")
                    }
                    
                }
            }
            
            HStack {
                Text("01 \n\nЧтобы показать заказчику эскизы, нужно где-то найти тексты и картинки. Как правило, ни того, ни другого в момент показа эскизов у дизайнера нету. Что же делает дизайнер? Рыбу. \n\n02\n\nРыбу можно вставлять, использовать, вешать, заливать, показывать, запихивать... Словом, с ней делают что угодно, лишь бы эскиз был максимально похож на готовую работу.\n\n03\n\nЕсли в качестве рыбных картинок использовать цветные прямоугольники, а вместо текста — несколько повторяющихся слов, эскиз будет выглядеть неестественно.\n Ясность нашей позиции очевидна: перспективное планирование не даёт нам иного выбора, кроме определения как самодостаточных, так и внешне зависимых концептуальных решений. Кстати, интерактивные прототипы функционально разнесены на независимые элементы.")
                    .font(Font.custom("VelaSans-Regular", size: 14))
                    .frame(width: 300, height: isReadMoreTap == true ? 500 : 100)
                    .padding(.leading, 25)
            }
            
            Button {
                if isReadMoreTap == true {
                    self.isReadMoreTap = false
                } else {
                    self.isReadMoreTap = true
                }
            } label: {
                HStack {
                    Text(isReadMoreTap == true ? "Свернуть" : "Читать дальше")
                        .font(Font.custom("VelaSans-Bold", size: 16))
                        .foregroundStyle(Color(red: 134 / 255, green: 93 / 255, blue: 230 / 255))
                }
            }
            .padding(.trailing, isReadMoreTap == false ? 150 : 200)
            .padding(.top)
            
            HStack {
                Image(uiImage: UIImage(named: "post_photo_2")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 196, height: 240)
                    .padding(.leading, 130)
                    .padding(.top)
                
                Image(uiImage: UIImage(named: "post_photo_3")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 196, height: 240)
                    .padding(.top)
                
                Spacer()
            }
            
            HStack {
                HStack {
                    Image(systemName: "heart")
                        .frame(width: 20, height: 20)
                    
                    Text("12")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 50)
                
                Spacer()
                
                HStack {
                    Image(systemName: "ellipsis.bubble")
                        .frame(width: 20, height: 20)
                    
                    Text("4")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 50)
                
                Spacer()
                
                HStack {
                    Image(systemName: "arrow.left.arrow.right")
                        .frame(width: 20, height: 20)
                    
                    Text("7")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 50)
                
                Spacer()
                
                HStack {
                    Image(systemName: "eye.fill")
                        .frame(width: 20, height: 20)
                    
                    Text("170")
                        .font(Font.custom("VelaSans-Regular", size: 14))
                }
                .frame(width: 55)
                
            }
            .padding(.top)
            .opacity(0.4)
            .frame(width: 300)
            .padding(.leading, 20)
            
            Rectangle()
                .frame(height: 1)
                .opacity(0.1)
                .padding(.top)
        }
    }
}

#Preview {
    ProfilePostView()
}
