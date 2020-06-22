import SwiftUI

struct SmallCard: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("🌿")
            Text(self.text)
        }
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .topLeading)
        .padding()
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard("Test")
    }
}
