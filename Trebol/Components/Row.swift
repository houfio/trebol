import SwiftUI

struct Row: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(self.text)
            Spacer()
            Image(systemName: "chevron.right")
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .padding(.top)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row("Test plant")
    }
}
