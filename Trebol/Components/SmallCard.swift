import SwiftUI

struct SmallCard: View {
    private let plant: PlantModel

    init(_ plant: PlantModel) {
        self.plant = plant
    }

    var body: some View {
        NavigationLink(destination: DetailView(DetailViewModel(plant: self.plant))) {
            VStack(alignment: .leading, spacing: 5) {
                Text("🌿")
                Text(self.plant.name)
            }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 4)
                .padding(.vertical, 8)
        }
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(PlantModel(PlantContainer(id: 142735, scientificName: "Hibiscus moscheutos")))
    }
}
