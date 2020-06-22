import SwiftUI

struct Row: View {
    private let plant: PlantModel
    
    init(_ plant: PlantModel) {
        self.plant = plant
    }
    
    var body: some View {
        NavigationLink(destination: DetailView(DetailViewModel(plant: self.plant))) {
            Text(self.plant.name)
                .padding()
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(PlantModel(PlantContainer(id: 0, scientificName: "Row")))
    }
}
