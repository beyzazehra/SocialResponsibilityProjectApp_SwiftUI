import Foundation
import SwiftUI

extension Text {
    func openSansFont(size: CGFloat) -> Text {
        return self.font(.custom("OpenSans-Regular", size: size))
    }
}
