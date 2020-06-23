import Foundation
import Combine

class CollectionViewModel: ObservableObject {
    private let collectionService = CollectionService()

    @Published var plants = [PlantDetailModel]()

    init() {
        self.plants = self.collectionService.getPlants()
    }

    func add(_ plant: PlantDetailModel) {
        self.plants = self.collectionService.add(self.plants, plant: plant)
    }

    func remove(_ plant: PlantDetailModel) {
        self.plants = self.collectionService.remove(self.plants, plant: plant)
    }

    func toggle(_ plant: PlantDetailModel) {
        self.contains(plant) ? self.remove(plant) : self.add(plant)
    }

    func contains(_ plant: PlantDetailModel) -> Bool {
        self.collectionService.contains(self.plants, id: plant.id)
    }
}
