import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let trefleService = TrefleService()
    private let plantIds = [142722, 142735, 175814, 189349, 153952, 153939, 153951, 104800, 105301]

    @Published var plants = [PlantDetailModel]()

    var loading: Bool {
        self.plants.count <= 3
    }
    var cancellable: [AnyCancellable]?

    init() {
        self.cancellable = self.plantIds.map { id in
            self.trefleService.fetchPlant(id).sink(receiveCompletion: { completion in
                print("home \(completion)")
            }, receiveValue: { detailContainer in
                self.plants.append(PlantDetailModel(detailContainer))
            })
        }
    }
}
