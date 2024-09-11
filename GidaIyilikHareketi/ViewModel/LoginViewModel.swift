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
    
    
}

