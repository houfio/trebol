import SwiftUI

struct Row: View {
    private let plant: PlantModel

    init(_ plant: PlantModel) {
        self.plant = plant
    }

    var body: some View {
        NavigationLink(destination: DetailView(DetailViewModel(plant: self.plant))) {
            HStack {
                Text(self.plant.name)
                Spacer()
                Image(systemName: "chevron.right")
            }
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
            .buttonStyle(EffectButtonStyle())
            .padding(.horizontal)
            .padding(.vertical, 3)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(PlantModel(PlantContainer(id: 0, scientificName: "Plant")))
    }
}
