import Foundation
import SwiftUI
import Combine


class CreateAddViewModel: ObservableObject {
        
    var advertName: String = ""
    var advertKilo: Int = 0
    var advertDescription: String = ""

        
        func postAdd() {
            
            
            CreateAddService().postAdd(advertName: advertName, advertKilo: advertKilo, advertDescription: advertDescription) { result in
                switch result {
                    case .success(let token):
                  
                        DispatchQueue.main.async {
                            
                           
                       }
                
                    
                    case .failure(let error):
                        print(error.localizedDescription)
                       
                    
                }
            }
        }
        
        
    }


