import Foundation
import Combine

class HomeViewModel: ObservableObject, Identifiable {
    @Published public var plants: [Plant] = []
    
    init() {
        Fetch().get(route: "plants") { (json: [Plant]) in
            self.plants = json
        }
    }
    
    public func getRandomPlants(amount: Int = 5, max: Int = 200) -> Void {
        var objects: [Plant] = []
        
        for plant in (1...amount).map({_ in Int.random(in: 1...max)}) {
            Fetch().get(route: "plants/\(plant)") { (json: Plant) in
                objects.append(json)
            }
        }
        
        self.plants = objects
    }
}

