import SwiftUI

struct SearchBarView: View {
    
    @EnvironmentObject var vm : RestaurantViewModel
    
    var body: some View {
        
        
        
            HStack {
            
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.black)
                TextField("Restaurant arayın", text: $vm.searchText)
                    .foregroundColor(Color.black)
                
                    .overlay(
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: 10)
                            .foregroundColor(Color.black)
                            .opacity(vm.searchText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                vm.searchText = ""
                            }
                        
                        ,alignment: .trailing
                    )
               
            }
            .font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(
                        color: Color.theme.background.opacity(0.15),
                        radius: 10, x:0, y:0)
            )
            
            
            
     
    }
}
