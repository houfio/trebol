import Foundation
import Combine

class HomeViewModel: ObservableObject, Identifiable {
    @Published public var plants: [Plant] = []
    
    init() {
        self.getPlants()
    }
    
    private func getPlants() -> Void {
        Fetch.get(route: "plants") { (plants: [Plant]) in
            for plant in plants {
                Fetch.get(route: "plants/\(plant.id)") { (plant: Plant) in
                    self.plants.append(plant)
                }
            }
        }
    }
}
