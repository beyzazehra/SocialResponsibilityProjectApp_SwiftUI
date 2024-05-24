import SwiftUI

struct StatusListCellView: View {
    
    @State var profileImage:String
    @State var restaurantName:String
    
    var body: some View {
        
            HStack {
                Image(profileImage)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Text(restaurantName)
            
        }
        Divider()
    }
}

#Preview {
    StatusListCellView(profileImage: "profile", restaurantName: "Sinop Mantı")
}
