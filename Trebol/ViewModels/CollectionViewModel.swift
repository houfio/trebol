import Foundation
import Combine

class CollectionViewModel: ObservableObject {
    private let collectionService = CollectionService()

    @Published var plants = [PlantDetailModel]()

    init() {
        
    }
}


