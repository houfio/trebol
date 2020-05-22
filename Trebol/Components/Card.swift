import SwiftUI

struct Card: View {
    @Environment(\.colorScheme) var colorScheme
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
                    .frame(width: geometry.size.width, height: 190)
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(self.name)
                            .font(.title)
                            .bold()
                            .lineLimit(1)
                        Text(self.scientificName)
                            .font(.subheadline)
                            .bold()
                            .lineLimit(1)
                        Text(self.family)
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.systemGray))
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "tray.and.arrow.down")
                        .foregroundColor(Color(UIColor.systemGray))
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(self.colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
        .padding(.vertical)
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
