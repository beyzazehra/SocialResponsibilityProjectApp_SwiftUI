import SwiftUI

struct SignUpView: View {
    
    @StateObject var vm: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                
                VStack(spacing:40) {
                    
                    Picker("seç",selection: $vm.accountType){ ForEach(Choice.allCases) { choice in
                        Text(choice.rawValue.capitalized)
                    }
                        
                        
                    }
                    
                    
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                    
                    VStack(spacing: 20.0) {
                        InputFieldView(data: $vm.mail, title: "Ad-Soyad / Kurum Adı")
                        InputFieldView(data: $vm.mail, title: "Kullanıcı Adı")
                        if vm.accountType == .Kurumsal {
                            InputFieldView(data: $vm.mail, title: "Adres")
                        }
                        
                        InputFieldView(data: $vm.mail, title: "E-Posta")
                        InputFieldView(data: $vm.password, title: "Şifre")
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
