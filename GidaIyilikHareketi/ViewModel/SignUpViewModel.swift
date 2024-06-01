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
     @Published var showErrorAlert: Bool = false
     var email: String = ""
     var password: String = ""
     var fullName: String = ""
     var nickname: String = ""
     var address: String = ""
     var phoneNumber: String = ""
     @Published var accountType: Choice = .Bireysel
    

   
    func register() {
        
        let keychain = KeychainSwift()
        
        
        Webservices().register(fullName: fullName, nickname: nickname, email: email, password: password, address: address,accountType: accountType,phoneNumber: phoneNumber ) { result in
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
