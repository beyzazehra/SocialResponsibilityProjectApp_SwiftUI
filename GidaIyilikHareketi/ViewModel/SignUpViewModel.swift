import Foundation
import SwiftUI
import Combine
import KeychainSwift


enum Choice: String,CaseIterable, Identifiable {
    case Bireysel
    case Kurumsal
    var id: Self {self}
}



class SignUpViewModel: ObservableObject {
    
     @Published var isRegistered: Bool = false
     var mail: String = ""
     var password: String = ""
     var name: String = ""
     var username: String = ""
     var location: String = ""
     var accountType: Choice = .Bireysel
    

   
    func register() {
        
        let keychain = KeychainSwift()
        
        
        Webservices().register(username: username, password: password) { result in
            switch result {
            case .success(let token):
                keychain.set(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isRegistered = true
                    
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                self.showErrorAlert = true
                
            }
        }
    }
    
}
