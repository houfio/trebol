import Foundation
import Combine

final class CollectionService: ObservableObject {
    private let saveKey = "collection"

    func getPlants() -> [PlantDetailModel] {
        var plants: [PlantDetailModel] = []

        if let data = UserDefaults.standard.data(forKey: self.saveKey) {
            if let decoded = try? JSONDecoder().decode([PlantDetailContainer].self, from: data) {
                plants = decoded.map { plant in
                    PlantDetailModel(plant)
                }
            }
        }

        return plants
    }

    func contains(_ plants: [PlantDetailModel], id: Int) -> Bool {
        plants.contains(where: { p in
            p.id == id
        })
    }

    func add(_ plants: [PlantDetailModel], plant: PlantDetailModel) -> [PlantDetailModel] {
        self.save(plants + [plant])
    }

    func remove(_ plants: [PlantDetailModel], plant: PlantDetailModel) -> [PlantDetailModel] {
        self.save(plants.filter({ p in
            p.id != plant.id
        }))
    }

    private func save(_ plants: [PlantDetailModel]) -> [PlantDetailModel] {
        var plantContainers: [PlantDetailContainer] = []

        plants.forEach { plant in
            plantContainers.append(PlantDetailContainer(id: plant.id, scientificName: plant.name, images: [], subSpecies: []))
        }

        if let encoded = try? JSONEncoder().encode(plantContainers) {
            UserDefaults.standard.set(encoded, forKey: self.saveKey)
        }

        return plants
    }
}
