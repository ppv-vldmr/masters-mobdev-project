import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(named: "Logo_splash")!)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
        }
    }
}

#Preview {
    SplashScreenView()
}
