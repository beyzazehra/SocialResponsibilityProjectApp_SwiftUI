import Foundation

struct AdvertModel: Codable,Hashable {
    let advertID: Int
    let advertName: String
    let advertKilo: Int
    let advertDescription, advertDate: String
    let restaurantID: Int

    enum CodingKeys: String, CodingKey {
        case advertID = "advertId"
        case advertName, advertKilo, advertDescription, advertDate
        case restaurantID = "restaurantId"
    }
}
