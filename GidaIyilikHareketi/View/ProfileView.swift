import SwiftUI

struct ProfileView: View {
    
    @State var name:String = "beyza"
    @State var surname:String = "olgunsoy"
    @State var userName:String = "beyzazehra"
    @State var foodKg:Int
    @State var paket:Int
    @State var showSheet:Bool = false
    
    @State private var selectedTab: Tab = .person
    @StateObject var personVM: PersonViewModel = PersonViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Image("profile")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())

                
                HStack {
                    Text(personVM.persons?.personName ?? "beyza")
                        .font(.title)
                        .font(.custom("OpenSans-Bold", size: 20))
                    
                    Text(personVM.persons?.personSurname ?? "olgunsoy")
                        .font(.title)
                        .font(.custom("OpenSans-Bold", size: 20))
                }
                
                
                Text(personVM.persons?.personNickName ?? "@beyzazehra")
                    .font(.title)
                    .font(.custom("OpenSans-Bold", size: 20))
                
                Button(action: { showSheet.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                    Text("İlan Oluştur")
                        .font(.title3)
                    
                        .padding(.horizontal)
                          
                      }
                      .padding()
                      .background(Color.theme.accent)
                      .foregroundColor(.white)
                      .cornerRadius(20)
                
                      .padding()
                      .sheet(isPresented: $showSheet, content: {
                          CreateAddView()
                      })
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
                        .frame(width: 345, height: 100)
                    Text("Gıda İyilik Adımın:")
                        .font(.title2)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: 345, height: 100)
                    Text("Doyurduğun Canlı Sayısı:")
                        .font(.title2)
                }
            }
            
            
        }
        
        .task{
            do {
                try await personVM.fetchPersonsFromAPI()
            } catch {
                
            }
            
            
        }
    }
        
    
}

#Preview {
    
    ProfileView(foodKg: 3, paket: 3)
    
    
    
}
