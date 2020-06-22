import SwiftUI

struct SmallCard: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "heart")
            
            Text(self.text)
        }
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .topLeading)
        .padding()
        .cornerRadius(10)
        .shadow(radius: 8)
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard("Test")
    }
}
