import SwiftUI

struct EduVideoView: View {
    
    @State var rectangleColor:Color
    @State var rectangleDescription:String
    @State var rectangleImage:String
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(rectangleColor)
                .frame(width:150, height:150)
                Image(rectangleImage)
                Image(systemName: "play.square.fill")
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 100))
            }
            
            Text(rectangleDescription)
           
              
        }
    }

}

#Preview {
    EduVideoView(rectangleColor: Color.theme.edu1, rectangleDescription: "selam", rectangleImage: "balon")
}
