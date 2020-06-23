import SwiftUI

struct SmallCard: View {
    @EnvironmentObject private var collectionViewModel: CollectionViewModel
    private let plant: PlantDetailModel?
    private let name: String?

    init(_ plant: PlantDetailModel? = nil, name: String? = nil) {
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
            return AnyView(NavigationLink(destination: DetailView(DetailViewModel(detail: self.plant), collectionViewModel: self.collectionViewModel)) {
                vStack
            }
                .buttonStyle(EffectButtonStyle()))
        }
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(PlantDetailModel(PlantDetailContainer(id: 142735, scientificName: "Hibiscus moscheutos", images: [], subSpecies: [])))
    }
}
