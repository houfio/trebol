import Foundation
import Combine

class SearchViewModel: ObservableObject, Identifiable {
    @Published public var plants: [Plant] = []
    @Published public var text: String = ""
    
    public func searchPlants() -> Void {
        Fetch.get(route: "plants", query: "&q=\(self.text)") { (plants: [Plant]) in
            self.plants = plants
        }
    }
}
