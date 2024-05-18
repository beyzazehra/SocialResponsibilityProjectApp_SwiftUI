import SwiftUI

struct MapButton: View {
    
    var buttonText: String
    var body: some View {
            
        Text(buttonText)
                .fontWeight(.heavy)
                .font(.caption)
                .padding(10)
                .foregroundColor(.white)
                .background(Color.theme.accent)
                .cornerRadius(40)
    }
}

#Preview {
    MapButton(buttonText: "merhaba")
}
