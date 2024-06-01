import SwiftUI

struct FirstView: View {
    var body: some View {
       
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                VStack {
                    Image("donation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250, alignment: .bottom)
                        .foregroundColor(Color.white)
                    
                    Text("Merhaba!")
                        .font(.title)
                        .openSansFont(size: 24)
                    Text("Bugün nasıl bir iyilik yapmak istersiniz ?")
                    Spacer()
                    
                    Spacer().frame(height: 20)
                    
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        customButton(label: "Atık gıdam var", description: "Gıdaları ilgili istasyon noktalarına bırakabilirsiniz", imageName: "a")
                    }
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        customButton(label: "Atık gıda götüreceğim", description: "İlgili istasyonlardan alacağınız gıdaları patili dostlarımıza ulaştırabilirsiniz", imageName: "b")
                    }
                    
                    
                    
                    Spacer()
                    NavigationLink(destination: NavBarView()) {
                        
                        myButton(buttonText: "Şimdilik atla")
                    }.isDetailLink(false)

                }
            }
   
    }
    
    private func customButton(label: String, description: String, imageName: String) -> some View {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(label)
                        .font(.custom("OpenSans-Bold", size: 20))
                        .foregroundColor(.black)
                    
                    Text(description)
                        .font(.custom("OpenSans-Regular", size: 12))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if imageName == "a" {
                    Image("a")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                } else if imageName == "b" {
                    Image("b")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                }
            }
            .padding(18)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 8)
            .frame(width: 350, height: 100)
        }

    
}
#Preview {
    FirstView()
}


