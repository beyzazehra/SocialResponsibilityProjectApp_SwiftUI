import SwiftUI

struct SignUpView: View {
    
    @State var mail: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var username: String = ""
    @State var location: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing:40) {
                    
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()

                    VStack(spacing: 20.0) {
                        InputFieldView(data: $mail, title: "Ad-Soyad / Kurum Adı")
                        InputFieldView(data: $mail, title: "Kullanıcı Adı")
                        InputFieldView(data: $mail, title: "Konum")
                        InputFieldView(data: $mail, title: "E-Posta")
                        InputFieldView(data: $password, title: "Şifre")
                        }
                        Button(action: {}) {
                            Text("Kayıt Ol")
                                .fontWeight(.heavy)
                                .font(.title3)
                                .frame(width: 250, height: 25, alignment: .center)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [.green, .accentColor]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                    
                    Spacer()
                }
                    
                }
                
                
            }
        }
    }


#Preview {
    SignUpView()
        
}
