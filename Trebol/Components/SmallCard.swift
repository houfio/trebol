import SwiftUI

struct SmallCard: View {
    private let plant: PlantModel?
    private let name: String?

    init(_ plant: PlantModel? = nil, name: String? = nil) {
        self.name = name
        self.plant = plant
    }

    var body: some View {
        let vStack = VStack(alignment: .leading, spacing: 5) {
            Text("🌿")
            Text(self.name != nil ? self.name! : self.plant!.name)
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
        
        if self.name != nil {
            return AnyView(vStack)
        } else {
            return AnyView(NavigationLink(destination: DetailView(DetailViewModel(plant: self.plant))) {
                vStack
            }
                .buttonStyle(EffectButtonStyle()))
        }
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(PlantModel(PlantContainer(id: 142735, scientificName: "Hibiscus moscheutos")))
    }
}
