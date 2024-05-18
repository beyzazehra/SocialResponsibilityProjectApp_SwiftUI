import SwiftUI

struct StatusView: View {
    
    @State private var selectedTab: Tab = .person
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
        
            Image("crown")
                .position(x: 190, y: 25)
            Image("profil")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .position(x: 80, y: 180)
            Image("2")
                .resizable()
                .frame(width: 100, height: 140)
                .position(x: 80, y: 300)
            Image("profil")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .position(x: 190, y: 100)
            Image("1")
                .resizable()
                .frame(width: 110, height: 220)
                .position(x: 190, y: 260)
            Image("profil")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .position(x: 300, y: 210)
            Image("3")
                .resizable()
                .frame(width: 100, height: 110)
                .position(x: 300, y: 315)
        
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 350, height: 280)
                .position(x: 195, y: 530)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .trailing) {
                    HStack {
                        Image("profil")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Text("Burger King")
                    }
                    Divider()
                    HStack {
                        Image("profil")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Text("Burger King")
                    }
                    Divider()
                    HStack {
                        Image("profil")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Text("Burger King")
                    }
                    Divider()
                    HStack {
                        Image("profil")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Text("Burger King")
                    }
                    Divider()
                    HStack {
                        Image("profil")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Text("Burger King")
                    }
                }
            }
            .frame(width: 330, height: 250)
            .position(x: 195, y: 530)
        }
    }
}

#Preview {
    StatusView()
}
