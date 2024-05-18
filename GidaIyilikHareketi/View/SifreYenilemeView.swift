import SwiftUI

struct SifreYenilemeView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Image("lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text("Şifreni mi unuttun?")
                        .font(.title)
                        .openSansFont(size: 24)
                        .foregroundColor(.accent)
                        .padding()
                    
                    Spacer()
                }
                
                Text("Parolanı sıfırlamak için e-posta adresine talimatlar göndereceğiz")
                    .padding()
                
                InputFieldView(data: $username, title: "E-Posta")
                    
                
                Spacer()
                
                Button(action: {}) {
                    Text("Sıfırla")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(width: 250, height: 25)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.green, .accentColor]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
            }
        }
    }
}
#Preview {
    SifreYenilemeView()
}
