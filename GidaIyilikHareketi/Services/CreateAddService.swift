import Foundation

enum PostError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkPostError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct PostRequestBody: Codable {
    let advertName: String
    let advertKilo: Int
    let advertDescription: String
}

struct PostResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

struct PostRequestResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}


class CreateAddService {
    
    func postAdd(advertName: String, advertKilo: Int, advertDescription:String, completion: @escaping (Result<String, PostError>) -> Void) {
        
        guard let url = URL(string: "http://beykent.dhlrdlab.com/api/adverts") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = PostRequestBody(advertName: advertName, advertKilo: advertKilo, advertDescription:advertDescription)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            try! JSONDecoder().decode(PostResponse.self, from: data)
            
            guard let postResponse = try? JSONDecoder().decode(PostResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = postResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
        }.resume()
        
    }
}
