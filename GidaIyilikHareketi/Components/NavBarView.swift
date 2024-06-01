import SwiftUI

enum Tab: String, CaseIterable {
    case forkKnife = "fork.knife.circle"
    case infoCircle = "info.circle"
    case qrcodeviewfinder = "qrcode.viewfinder"
    case star
    case person
}

struct NavBarView: View {
    
    @State private var selectedTab: Tab = .forkKnife
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                NavigationView {
                    RestaurantView()
                }
                .tabItem {
                    Image(systemName: Tab.forkKnife.rawValue)
                    
                }
                .tag(Tab.forkKnife)
                
                
                NavigationView {
                    BlogView()
                }
                .tabItem {
                    Image(systemName: Tab.infoCircle.rawValue)
                    
                }
                .tag(Tab.infoCircle)
                
                NavigationView {
                    QRView()
                }
                .tabItem {
                    Image(systemName: Tab.qrcodeviewfinder.rawValue)
                    
                }
                .tag(Tab.qrcodeviewfinder)
                
                NavigationView {
                    StatusView()
                }
                .tabItem {
                    Image(systemName: Tab.star.rawValue)
                    
                }
                .tag(Tab.star)
                
                NavigationView {
                    ProfileView(foodKg: 3, paket: 3)
                }
                .tabItem {
                    Image(systemName: Tab.person.rawValue)
                    
                }
                .tag(Tab.person)
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
           
            
        }
        
    }
}

#Preview {
    NavBarView()
}

