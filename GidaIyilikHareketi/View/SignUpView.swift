import SwiftUI

struct SignUpView: View {
    
    @StateObject var vm: SignUpViewModel = SignUpViewModel()

    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                
                VStack(spacing:30) {
                    
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                    
                    Picker("seç",selection: $vm.accountType){ ForEach(Choice.allCases) { choice in
                        Text(choice.rawValue.capitalized)
                    }
                        
                        
                    }.accentColor(.black)
                        .pickerStyle(.segmented)
                        .padding()
                    
                    
                    
                    VStack(spacing: 20.0) {
                        InputFieldView(data: $vm.fullName, title: "Ad-Soyad / Kurum Adı")
                        InputFieldView(data: $vm.nickname, title: "Kullanıcı Adı")
                        if vm.accountType == .Kurumsal {
                            InputFieldView(data: $vm.address, title: "Adres")
                        }
                        
                        InputFieldView(data: $vm.email, title: "E-Posta")
                        InputFieldView(data: $vm.password, title: "Şifre")
                        InputFieldView(data: $vm.phoneNumber, title: "Telefon Numarası")
                    }
                    
            
                        Button(action: {vm.register()}) {
                            Text("Kayıt Ol")
                                .fontWeight(.heavy)
                                .font(.title3)
                                .frame(width: 250, height: 25, alignment: .center)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [.green, .accentColor]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                        }
                        .navigationDestination(isPresented: $vm.isRegistered) {
                            LoginView()
                        
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
