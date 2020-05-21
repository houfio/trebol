import SwiftUI

struct Card: View {
    @Binding public var favorited: Bool
    
    public var family: String
    public var scientificName: String
    public var name: String
    public var header: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Image(self.header)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.27) // 3
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(self.name)
                            .font(.title)
                            .bold()
                        Text(self.scientificName)
                            .font(.subheadline)
                            .bold()
                        Text(self.family)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "tray.and.arrow.down")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
      @State private var favorited = false

      var body: some View {
        Card(favorited: $favorited, family: "Tree", scientificName: "Kalolaw minoqie", name: "Apple tree with leaves", header: "plant")
      }
    }
}
