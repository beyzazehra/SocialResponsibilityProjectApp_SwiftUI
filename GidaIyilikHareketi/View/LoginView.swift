import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing:40) {
                    ZStack {
                        Image("Vector")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 350, alignment: .bottom)
                            .foregroundColor(Color.background)
                            .ignoresSafeArea()
                        
                        Image("cat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 350, alignment: .topLeading)
                            .foregroundColor(Color.white)
                            .ignoresSafeArea()
                        
                    }
                    Text("Oturum Aç")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()

                    VStack(spacing: 20.0) {
                            InputFieldView(data: $username, title: "E-Posta")
                            InputFieldView(data: $password, title: "Şifre")
                        }
                        Button(action: {}) {
                            Text("Oturum Aç")
                                .fontWeight(.heavy)
                                .font(.title3)
                                .frame(width: 250, height: 25, alignment: .center)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [.green, .accentColor]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                    NavigationLink(destination: SifreYenilemeView()) {
                        Text("Şifreni mi unuttun ?")
                        .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                        .underline()
                    }
                    NavigationLink(destination: SignUpView()) {
                        Text("Hesabın yok mu ? Kayıt ol")
                        .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                        .underline()
                    }
                    Spacer()
                }
                    
                
                
                
            }
        }
    }


#Preview {
    LoginView()
        
}
