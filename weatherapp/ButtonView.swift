import SwiftUI

struct ButtonView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .background(.white)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10)
    }
}
