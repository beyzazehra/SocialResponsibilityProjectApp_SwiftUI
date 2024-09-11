import SwiftUI

struct InputFieldView: View {
    
    @Binding var data: String
    
    var title: String?
    
    var body: some View {
        ZStack {
            TextField("", text: $data)
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 42)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            HStack {
                Text(title ?? "Input")
                    .textInputAutocapitalization(.never)
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background(Color.theme.background)
                
                Spacer()
            }
            .padding(.leading, 8)
            .offset(x: +50, y: -20)
        }
    }
    
    struct InputFieldView_Previews: PreviewProvider {
        @State static var data: String = ""
        
        static var previews: some View {
            InputFieldView(data: $data, title: "Password")
        }
    }
}
