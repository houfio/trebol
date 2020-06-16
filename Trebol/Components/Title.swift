import SwiftUI

struct Title: View {
    public var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(title: "Planten")
    }
}
