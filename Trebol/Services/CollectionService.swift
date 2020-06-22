import Foundation
import Combine

final class CollectionService: ObservableObject {
    private let saveKey = "collection"

    @Published var plants: [PlantDetailModel] = []

    init() {
        if let data = UserDefaults.standard.data(forKey: self.saveKey) {
            if let decoded = try? JSONDecoder().decode([PlantDetailContainer].self, from: data) {
                decoded.forEach { plant in
                    self.plants.append(PlantDetailModel(plant))
                }
            }
        }
    }

    func contains(_ plant: PlantDetailModel) -> Bool {
        self.plants.contains(where: { p in
            p.id == plant.id
        })
    }

    func add(_ plant: PlantDetailModel) {
        self.plants.append(plant)
        self.save()
    }

    func remove(_ plant: PlantDetailModel) {
        self.plants.removeAll { p in
            p.id == plant.id
        }
        self.save()
    }

    private func save() {
        var plantContainers: [PlantDetailContainer] = []
        
        self.plants.forEach { plant in
            plantContainers.append(PlantDetailContainer(id: plant.id, scientificName: plant.name, images: []))
        }
        
        if let encoded = try? JSONEncoder().encode(plantContainers) {
            UserDefaults.standard.set(encoded, forKey: self.saveKey)
        }
    }
}
