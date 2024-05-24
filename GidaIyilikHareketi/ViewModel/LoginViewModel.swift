import Foundation
import SwiftUI
import Combine
import KeychainSwift

class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    
    @Published var isAuthenticated: Bool = false
    @Published var showErrorAlert: Bool = false
    
    func login() {
        
        let keychain = KeychainSwift()
        
        
        Webservices().login(username: username, password: password) { result in
            switch result {
                case .success(let token):
                keychain.set(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                       
                   }
            
                
                case .failure(let error):
                    print(error.localizedDescription)
                    self.showErrorAlert = true
                
            }
        }
    }
    
    
    
    //    func postLoginRequest() async throws -> Void {
    //
    //
    //
    //        let url = URL(string: "http://beykent.dhlrdlab.com/api/persons/login")!
    //        var request = URLRequest(url: url)
    //        request.httpMethod = ("POST")
    //        let parameters:[String:Any] = ["username":username,"password":password]
    //        print(parameters)
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    //
    //        let (data, _) = try await URLSession.shared.data(for: request)
    //        print(String(data: data, encoding: .utf8)!)
    //
    //        DispatchQueue.main.async {
    //        }
    //
    //
    //    }
    
    }

