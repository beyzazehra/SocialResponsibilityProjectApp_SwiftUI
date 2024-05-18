import SwiftUI

struct ProfileView: View {
    
    var userName: String = "Beyza Olgunsoy"
    var foodKg: Int
    var paket: Int
    @State private var selectedTab: Tab = .person
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Image("profil")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())

                
                Text(userName)
                    .font(.title)
                    .font(.custom("OpenSans-Bold", size: 20))
                Spacer()
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 100)
                        HStack {
                            Text("\(foodKg) kg")
                            
                            Image("kg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .trailingFirstTextBaseline)
                                .padding()
                        }
                    }
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .frame(width: 170, height: 100)
                        HStack {
                            Text("\(paket) paket")
                            
                            Image("earth")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .trailingFirstTextBaseline)
                                .padding()
                        }
                    }
                    
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: 345, height: 140)
                    Text("Gıda İyilik Adımın")
                        .font(.title2)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: 345, height: 140)
                    Text("Doyurduğun Canlı Sayısı")
                        .font(.title2)
                }
            }
            
            
        }
        
        ;NavBarView()
    }
    
}

#Preview {
    
    ProfileView(foodKg: 3, paket: 3)
    
    
    
}
