import SwiftUI

struct SmallCard: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("🌿")
            Text(self.text)
                .foregroundColor(Color.black)
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
            .background(Color(UIColor.systemGreen))
            .cornerRadius(8)
            .padding()
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard("Test")
    }
}
