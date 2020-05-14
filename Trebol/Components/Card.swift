import SwiftUI

struct Card: View {
    @Binding public var favorited: Bool
    
    public var kind: String
    public var name: String
    public var header: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.kind)
                .font(.headline)
                .foregroundColor(Color.white)
            Text(self.name)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .lineLimit(3)
        }
        .padding(.all, 30.0)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Image(self.header))
        .opacity(0.8)
        .cornerRadius(12.5)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
      @State private var favorited = false

      var body: some View {
        VStack(spacing: 20) {
            Card(favorited: $favorited, kind: "Tree", name: "Apple tree with leaves", header: "plant")
            Card(favorited: $favorited, kind: "Tree", name: "Mango tree", header: "plant")
            Card(favorited: $favorited, kind: "Eating plant", name: "Fly eater", header: "plant")
        }
      }
    }
}
