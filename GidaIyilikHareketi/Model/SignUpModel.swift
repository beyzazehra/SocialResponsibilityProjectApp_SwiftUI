import Foundation

struct Person: Codable {
    let personID: Int
    let personName, personSurname, personEmail, personPassword: String
    let personNickName, personPhoneNumber: String
    let roleID: Int
    let passwordSalt: String

    enum CodingKeys: String, CodingKey {
        case personID = "personId"
        case personName, personSurname, personEmail, personPassword, personNickName, personPhoneNumber
        case roleID = "roleId"
        case passwordSalt
    }
}


struct Restaurant: Codable {
    let restaurantID: Int
    let restaurantName, restaurantAdress, restaurantNickname, restaurantMail: String
    let restaurantPassword, restaurantNumber: String
    let roleID: Int
    let passwordSalt: String

    enum CodingKeys: String, CodingKey {
        case restaurantID = "restaurantId"
        case restaurantName, restaurantAdress, restaurantNickname, restaurantMail, restaurantPassword, restaurantNumber
        case roleID = "roleId"
        case passwordSalt
    }
}
