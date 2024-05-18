import SwiftUI

struct StarView: View {
    
    @State var star:Int = 25
    
    var body: some View {
        
        HStack {
            
            Image("star")
            
            Text(star.formatted())
                .fontWeight(.heavy)
        }
        
        .foregroundColor(.gray)
        .frame(width: 70, height: 25)
        .padding(3)
        .background(Color.theme.background)
        .cornerRadius(90)
        
    }
}

#Preview {
    StarView(star: 25)
}
