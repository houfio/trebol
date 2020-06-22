import Foundation
import Combine

class CollectionViewModel: ObservableObject {
    private let collectionService = CollectionService()

    @Published var plants = [PlantDetailModel]()

    init() {
        self.plants = self.collectionService.initialise()
    }
    
    func add(_ plant: PlantDetailModel) {
        self.plants = self.collectionService.add(self.plants, plant: plant)
    }
    
    func remove(_ plant: PlantDetailModel) {
        self.plants = self.collectionService.remove(self.plants, plant: plant)
    }
    
    func contains(_ plant: PlantDetailModel) -> Bool {
        self.collectionService.contains(self.plants, id: plant.id)
    }
}


