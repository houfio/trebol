import Foundation

struct PlantDetailModel: Hashable {
    private let plant: PlantDetailContainer

    var id: Int {
        self.plant.id
    }

    var name: String {
        self.plant.scientificName
    }

    var image: String {
        self.plant.images.count > 0 ? plant.images[0].url : "https://tinyurl.com/yarufx3b"
    }

    var images: [String] {
        self.plant.images.map { image in
            image.url
        }
    }

    var species: [PlantModel] {
        self.plant.subSpecies.map { plant in
            PlantModel(plant)
        }
    }

    init(_ plant: PlantDetailContainer) {
        self.plant = plant;
    }
}
