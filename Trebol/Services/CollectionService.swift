import Foundation
import Combine

final class CollectionService: ObservableObject {
    private let saveKey = "collection"
    
    func initialise() -> [PlantDetailModel] {
        var plants: [PlantDetailModel] = []
        
        if let data = UserDefaults.standard.data(forKey: self.saveKey) {
            if let decoded = try? JSONDecoder().decode([PlantDetailContainer].self, from: data) {
                decoded.forEach { plant in
                    plants.append(PlantDetailModel(plant))
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
        var plants = plants
        plants.append(plant)
        
        self.save(plants)
        return plants
    }

    func remove(_ plants: [PlantDetailModel], plant: PlantDetailModel) -> [PlantDetailModel] {
        var plants = plants
        plants.removeAll { p in
            p.id == plant.id
        }
        
        self.save(plants)
        return plants
    }

    private func save(_ plants: [PlantDetailModel]) {
        var plantContainers: [PlantDetailContainer] = []
        
        plants.forEach { plant in
            plantContainers.append(PlantDetailContainer(id: plant.id, scientificName: plant.name, images: []))
        }
        
        if let encoded = try? JSONEncoder().encode(plantContainers) {
            UserDefaults.standard.set(encoded, forKey: self.saveKey)
        }
    }
}
