import SwiftUI

struct StartView: View {
    
    @State private var widthView = UIScreen.main.bounds.width
    @State private var heightView = UIScreen.main.bounds.height
    
    @State private var showRegistration = false
    @State private var showDialog = false
    
    var body: some View {
        if showRegistration {
            Login()
        } else {
            VStack {
                Image(uiImage: UIImage(named: "Logo_start")!)
                    .resizable()
                    .scaledToFit()
                    .padding(heightView * 0.054 / 5)
                    .frame(width: widthView, height: heightView * 0.054)
                
                Spacer()
                
                Text("Узнайте, что \nпроисходит в мире \nпрямо сейчас")
                    .font(Font.custom("VelaSans-Bold", size: 32))
                    .bold()
                    .frame(width: widthView * 0.91, alignment: .leading)
                
                Button {
                    showRegistration = true
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: widthView * 0.91, height: heightView * 0.066)
                            .cornerRadius(14)
                            .foregroundColor(.black)
                        Text("Войти")
                            .foregroundColor(.white)
                            .bold()
                            .font(Font.custom("VelaSans-Bold", size: 16))
                    }
                }
                .padding(.top, 100)
                
                ZStack {
                    Rectangle()
                        .frame(width: widthView * 0.91, height: 1)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                    
                    Text("   или   ")
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .bold()
                        .background(.white)
                        .font(Font.custom("VelaSans-Bold", size: 16))
                }
                .padding(.top, heightView * 0.02)
                .padding(.bottom, heightView * 0.02)
                
                Button {
                    showRegistration = true
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
                        
                        Text("Зарегистрироваться")
                            .foregroundColor(.black)
                            .bold()
                            .font(Font.custom("VelaSans-Bold", size: 16))
                    }
                }
                
                Spacer()
                
                Button {
                    showDialog = true
                } label: {
                    VStack(alignment: .leading) {
                        Text("Регистрируясь, вы принимаете ")
                            .foregroundColor(Color(hex: "898989"))
                            .font(Font.custom("VelaSans-Regular", size: 14))
                        + Text("Условия сервиса,")
                            .foregroundColor(Color(hex: "865DE6"))
                            .font(Font.custom("VelaSans-Regular", size: 14))
                        Text("Политику конфиденциальности ")
                            .foregroundColor(Color(hex: "865DE6"))
                            .font(Font.custom("VelaSans-Regular", size: 14))
                        + Text("и ")
                            .foregroundColor(Color(hex: "898989"))
                            .font(Font.custom("VelaSans-Regular", size: 14))
                        + Text("Политику")
                            .foregroundColor(Color(hex: "865DE6"))
                            .font(Font.custom("VelaSans-Regular", size: 14))
                        Text("в отношении файлов cookie")
                            .foregroundColor(Color(hex: "865DE6"))
                            .font(Font.custom("VelaSans-Regular", size: 14))
                    }
                }
                .frame(width: widthView * 0.91, height: heightView * 0.07)
            }
            .confirmationDialog("", isPresented: $showDialog) {
                Button("Условия сервиса") {
                    showDialog = false
                }
                Button("Политика конфиденциальности") {
                    showDialog = false
                }
                Button("Политика в отноiyнии файлов cookie") {
                    showDialog = false
                }
            }
        }
    }
}

#Preview {
    StartView()
}
