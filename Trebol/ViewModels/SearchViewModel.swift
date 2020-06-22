import Foundation
import Combine

class SearchViewModel: ObservableObject {
    private let trefleService = TrefleService()

    @Published var plants = [PlantModel]()
    @Published var search = ""
    @Published var loading = false

    var cancellable: AnyCancellable?

    func fetchPlants() {
        self.plants = []

        if self.search.isEmpty {
            return
        }

        self.loading = true

        self.cancellable = self.trefleService.fetchPlants(self.search).sink(receiveCompletion: { completion in
            print(completion)
        }, receiveValue: { plantContainers in
            self.plants = plantContainers.map {
                PlantModel($0)
            }
            self.loading = false
        })
    }
}
