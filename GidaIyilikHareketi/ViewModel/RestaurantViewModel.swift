import Foundation
import SwiftUI
import Combine

class RestaurantViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var adverts : [AdvertModel] = []
    
    
    init() {
        
    }
    
    
    func fetchAdvertsFromAPI() async throws -> Void{
      
            let url = URL(string: "http://beykent.dhlrdlab.com/api/adverts")!
            let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
            let wrapper = try JSONDecoder().decode([AdvertModel].self, from: data)
            DispatchQueue.main.async {
                self.adverts = wrapper
            }
    
        
    }
}
