import SwiftUI

struct BlogView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                
                Image("eğitimler")
                    .padding()
                
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 30))
                    
                       
                        .fill(Color.white)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Eğitimler")
                            .font(.title)
                            .fontWeight(.bold)
                      
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                
                                
                                VStack {
                                    EduVideoView(rectangleColor: Color.theme.edu1, rectangleDescription: "Hoş geldin,bağışçı!", rectangleImage: "balon")
                                    StarView(star: 35)
                                    
                                }
                                
                                
                                VStack {
                                    EduVideoView(rectangleColor: Color.theme.edu2, rectangleDescription: "Dönüştürme ipuçları", rectangleImage: "recycling")
                                    
                                    StarView(star: 15)
                                }
                                VStack {
                                    EduVideoView(rectangleColor: Color.theme.edu3, rectangleDescription: "CO2", rectangleImage: "star")
                                    
                                    StarView(star: 20)
                                }
                                
                            }
                            
                        }
                     
                    }.padding(20)
                    
                }   
                
                .frame(height: 300)
                .padding(.leading,25)
                
                Spacer()
            }

        }
        
        
    }
}
#Preview {
    BlogView()
}
