import SwiftUI

struct CreateAddView: View {
    
    @StateObject var postvm: CreateAddViewModel = CreateAddViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack(spacing:30) {
                    
                    Text("İlan Oluştur")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                    
                    VStack(spacing: 20.0) {
                        InputFieldView(data: $postvm.advertName, title: "İlan Adı")
                       InputFieldView(data: $postvm.advertName, title: "Miktar (kg)")
                        
                       InputFieldView(data: $postvm.advertDescription, title: "Açıklama")
                    }
                    
                    Button(action: {postvm.postAdd()}) {
                        Text("Oluştur")
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
    CreateAddView()
}
