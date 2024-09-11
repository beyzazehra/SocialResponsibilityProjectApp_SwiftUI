import Foundation

struct AddsModel: Codable,Hashable {
    
    let advertName: String
    let advertKilo: Int
    let advertDescription: String
    

    enum CodingKeys: String, CodingKey {
        
        case advertName, advertKilo, advertDescription
        
    }
}
