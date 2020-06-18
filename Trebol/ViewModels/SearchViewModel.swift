import Foundation
import Combine

class SearchViewModel: ObservableObject, Identifiable {
    @Published public var plants: [Plant] = []
    
    public func searchPlants(text: String) -> Void {
        Fetch.get(route: "plants", query: "&common_name=\(text)") { (plants: [Plant]) in
            self.plants = plants
        }
    }
}
