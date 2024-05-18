import SwiftUI

struct RestaurantBox: View {
    
    var restaurantName: String
    var distance: Int
    
    var body: some View {
        ZStack{
            Color(.white)
            HStack() {
                Spacer()
                VStack(spacing:15) {
                
                    VStack {
                        Text(restaurantName)
                            .font(.custom("OpenSans-Regular", size: 22))
                        Text("\(distance) km")
                            .font(.custom("OpenSans-Regular", size: 22))
                    }
                    MapButton(buttonText: "Haritada aç" )
                }
                Spacer()
                Image("b")
                
                
            }
            .padding(22)
        }
        .frame(maxWidth: 450, maxHeight : 130)
        .cornerRadius(15)
  
    
   
        
    }
}

#Preview {
   
 RestaurantBox(restaurantName: "Sbarro", distance: 1)
  
}
