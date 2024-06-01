import SwiftUI

struct QRView: View {
    var body: some View {
        VStack {
            Text("QR Kodun")
                .font(.largeTitle)
            Image("qr")
        }
    }
}

#Preview {
    QRView()
}
