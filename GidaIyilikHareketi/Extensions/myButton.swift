import SwiftUI

struct myButton: View {
    
    var buttonText: String


    
    
    var body: some View {
            Text(buttonText)
                .fontWeight(.heavy)
                .font(.title3)
                .frame(width: 150, height: 25)
                .padding()
                .foregroundColor(.white)
                .background(Color.theme.accent)
                .cornerRadius(40)
    }
}

#Preview {

    myButton(buttonText: "" )
}
