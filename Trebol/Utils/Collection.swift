import Foundation
import Combine

class Collection: ObservableObject {
    private var plants: [Plant]
    private let saveKey = "collection"
    
    init() {
        self.plants = UserDefaults.standard.object(forKey: self.saveKey) as? [Plant] ?? [Plant]()
    }
    
    public func getPlants() -> [Plant] {
        self.plants
    }

    public func contains(_ plant: Plant) -> Bool {
        self.plants.contains(where: { $0.id == plant.id })
    }

    public func add(_ plant: Plant) {
        objectWillChange.send()
        
        self.plants.append(plant)
        self.save()
    }

    public func remove(_ plant: Plant) {
        objectWillChange.send()
        
        self.plants.removeAll { $0.id == plant.id }
        self.save()
    }

    public func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.plants), forKey: self.saveKey)
    }
}
