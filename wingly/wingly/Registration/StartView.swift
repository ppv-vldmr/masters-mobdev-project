import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "Logo_start")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.top, 20)
            
            Spacer()
            
            HStack {
                Text("Узнайте, что \nпроисходит в мире \nпрямо сейчас")
                    .font(Font.custom("SFProDisplay-Bold", size: 32))
                    .bold()
            }
            .padding(.trailing, 45)
            
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.black)
                        
                    Text("Войти")
                        .foregroundColor(.white)
                        .bold()
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                }
            }
            .padding(.top, 100)
            
            ZStack {
                Rectangle()
                    .frame(width: 335, height: 1)
                    .foregroundColor(.gray)
                    .opacity(0.5)
                
                Text("   или   ")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .bold()
                    .background(.white)
                    .font(Font.custom("SFProDisplay-Bold", size: 16))
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 343, height: 54)
                        .cornerRadius(14)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(.black, lineWidth: 1)
                        )
                        
                    Text("Зарегистрироваться")
                        .foregroundColor(.black)
                        .bold()
                        .font(Font.custom("SFProDisplay-Bold", size: 16))
                }
            }
            
            Spacer()
            Text("Регистрируясь, вы принимаете Условия сервиса,\nПолитику конфиденциальности и Политику\nв отношении файлов cookie")
                .foregroundColor(.gray)
                .opacity(0.5)
                .font(Font.custom("SFProDisplay-Bold", size: 14))
                .padding(.trailing, 15)
            
           
        }
    }
}

#Preview {
    StartView()
}
