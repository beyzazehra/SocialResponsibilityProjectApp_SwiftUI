import Foundation

struct PersonModel: Codable {
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
