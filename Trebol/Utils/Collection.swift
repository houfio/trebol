import Foundation
import Combine

class Collection: ObservableObject {
    @Published private var plants: [Plant]
    private let saveKey = "collection"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Plant].self, from: data) {
                self.plants = decoded
                return
            }
        }
        
        self.plants = []
    }
    
    public func getPlants() -> [Plant] {
        self.plants
    }

    public func contains(_ plant: Plant) -> Bool {
        self.plants.contains(where: { $0.id == plant.id })
    }

    public func add(_ plant: Plant) {
        self.plants.append(plant)
        self.save()
    }

    public func remove(_ plant: Plant) {
        self.plants.removeAll { $0.id == plant.id }
        self.save()
    }

    public func save() {
        if let encoded = try? JSONEncoder().encode(self.plants) {
            UserDefaults.standard.set(encoded, forKey: self.saveKey)
        }
    }
}
