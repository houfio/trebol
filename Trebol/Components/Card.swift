import SwiftUI
import URLImage

struct Card: View {
    private let plant: PlantDetailModel

    init(_ plant: PlantDetailModel) {
        self.plant = plant
    }

    var body: some View {
        NavigationLink(destination: CollectionView()) {
            VStack(alignment: .center) {
                URLImage(URL(string: self.plant.image)!) { proxy in
                    proxy.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 180)
                        .clipped()
                        .cornerRadius(14)
                        .padding(.bottom, 6)
                }
                HStack {
                    Text("🌿")
                    Text(self.plant.name)
                    Spacer()
                }
            }
                .frame(width: 320, height: 215)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(28)
        }.buttonStyle(EffectButtonStyle())
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(PlantDetailModel(PlantDetailContainer(id: 0, scientificName: "Test", images: [])))
    }
}
