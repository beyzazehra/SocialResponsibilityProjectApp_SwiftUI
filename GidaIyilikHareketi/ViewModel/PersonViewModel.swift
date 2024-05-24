import Foundation
import SwiftUI
import Combine


class PersonViewModel: ObservableObject {
   
    @Published var persons : PersonModel? 
    
  
    
    func fetchPersonsFromAPI() async throws -> Void {
        
        
            let url = URL(string: "http://beykent.dhlrdlab.com/api/persons/2")!
            let (data, _) = try await URLSession.shared.data(from: url)
        print(data.description)
            let wrapper = try JSONDecoder().decode(PersonModel.self, from: data)
            DispatchQueue.main.async {
                self.persons = wrapper
            }
    
        
    }
}
