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
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard("Test")
    }
}
