import SwiftUI

struct RestaurantView: View {
    
    @StateObject var vm: RestaurantViewModel = RestaurantViewModel()
    @State private var selectedTab: Tab = .forkKnife
    
    var body: some View {
        
        ZStack{
            
            Color.theme.background
                .ignoresSafeArea()
            
            ZStack {
                
                VStack(spacing: 15) {
                    SearchBarView().environmentObject(vm)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            myButton(buttonText: "Yakındakiler")
                            myButton(buttonText: "Popüler")
                            myButton(buttonText: "Şu anda açık")
                            
                        }
                        
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing:15) {
                           
                            ForEach(vm.adverts, id: \.self) { advert in
                                RestaurantBox(restaurantName: advert.advertName, distance: advert.advertKilo)
                            }
                            
                            
                        }
                    }
                }
                
                
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .task{
            do {
                try await vm.fetchAdvertsFromAPI()
            } catch {
                
            }
            
            
        }
    }
    
    
    
}

#Preview {
    
    
    RestaurantView()
    
    
}
