import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct BireyselRegisterRequestBody: Codable {
    let PersonName: String
    let PersonSurname: String
    let PersonNickname: String
    let PersonEmail: String
    let PersonPassword: String
    let PersonPhoneNumber: String
    
}

struct KurumsalRegisterRequestBody: Codable {
    let restaurantName: String
    let restaurantSurname: String
    let restaurantNickname: String
    let restaurantMail: String
    let restaurantPassword: String
    let restaurantAdress: String
    let restaurantNumber: String
    
}


struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

struct RequestResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}


class Webservices {
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://beykent.dhlrdlab.com/api/persons/login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            try! JSONDecoder().decode(LoginResponse.self, from: data)
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
        
    }
    
    func register(fullName: String,nickname: String,email:String,password:String,address:String,accountType:Choice,phoneNumber:String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        
        var urlString = ""
        if accountType == .Bireysel {
            urlString = "http://beykent.dhlrdlab.com/api/persons"
        } else {
            urlString = "http://beykent.dhlrdlab.com/api/restaurants"
        }
        guard let url = URL(string: urlString) else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if accountType == .Bireysel {
            let bireyselbody = BireyselRegisterRequestBody(PersonName:fullName, PersonSurname: "",PersonNickname: nickname,PersonEmail: email,PersonPassword:password,PersonPhoneNumber: phoneNumber)
            request.httpBody = try? JSONEncoder().encode(bireyselbody)

        } else {
            let kurumsalbody = KurumsalRegisterRequestBody(restaurantName:fullName,restaurantSurname: "", restaurantNickname: nickname, restaurantMail: email, restaurantPassword: password, restaurantAdress: address, restaurantNumber: phoneNumber)
            
            request.httpBody = try? JSONEncoder().encode(kurumsalbody)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
//            print(String(data: data, encoding: .utf8)!)
            
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode == 200)
                {
                    completion(.success(""))
                    
                }
                
            } else {
                
                completion(.failure(.invalidCredentials))
            }
        }.resume()
        
    }
    
    
}

