import SwiftUI
import URLImage

struct Card: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject public var collection: Collection
    
    public var plant: Plant
    
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(URL(string: self.plant.images!.count > 0 ? plant.images![0].url : "https://tinyurl.com/yarufx3b")!) { proxy in
                proxy.image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .clipped()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(self.plant.commonName ?? "No name")
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                    Text(self.plant.scientificName)
                        .font(.subheadline)
                        .bold()
                        .lineLimit(1)
                    Text(self.plant.familyCommonName ?? "No family")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.systemGray))
                        .lineLimit(1)
                }
                
                Spacer()
                
                Button(action: {
                    self.collection.contains(self.plant) ? self.collection.remove(self.plant) : self.collection.add(self.plant)
                }) {
                    Image(systemName: self.collection.contains(self.plant) ? "tray.and.arrow.up" : "tray.and.arrow.down")
                        .foregroundColor(Color(UIColor.systemGray))
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .background(self.colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white)
        .cornerRadius(10)
        .shadow(radius: 8.0)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State private var favorited = false

        var body: some View {
            VStack {
                Text("Cards")
            }
        }
    }
}
