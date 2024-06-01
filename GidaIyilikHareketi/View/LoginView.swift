import SwiftUI

struct LoginView: View {
    
    @StateObject var vm: LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            NavigationLink(destination: NavBarView().navigationBarBackButtonHidden(true),isActive: $vm.isAuthenticated) {
                EmptyView()
            }

            
            VStack(spacing:30) {
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
                    
                    
                    InputFieldView(data: $vm.username, title: "E-Posta")
                    InputFieldView(data: $vm.password, title: "Şifre")
                    
                    
                    
                }
                
//                NavigationLink(destination: RestaurantView()) {
                    Button(action: {
                        Task {
                            vm.login()
                        }})
                {
                    
                        
                        Text("Oturum Aç")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(width: 250, height: 25, alignment: .center)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.green, .accentColor]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                    }
    
                NavigationLink(destination: PasswordResetView()) {
                    Text("Şifreni mi unuttun ?")
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.accent)
                        .underline()
                }
                NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true)) {
                    Text("Hesabın yok mu ? Kayıt ol")
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.accent)
                        .underline()
                    
                }
                Spacer()
                
            }
            
            
        }
     

                
        .alert(isPresented: $vm.showErrorAlert) {
                    Alert(title: Text("HATA"), message: Text("Yanlış e-mail ya da şifre"), dismissButton: .default(Text("OK")))
                }
    }
    
}


#Preview {
    LoginView()
    
}
