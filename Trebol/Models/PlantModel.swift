import Foundation

struct PlantModel: Hashable {
    private let plant: PlantContainer

    var id: Int {
        self.plant.id
    }

    var name: String {
        self.plant.scientificName
    }

    init(_ plant: PlantContainer) {
        self.plant = plant;
    }
}
