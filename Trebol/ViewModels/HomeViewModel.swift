import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let trefleService = TrefleService()
    private let plantIds = [142722, 142735, 175814, 189349, 153952, 153939, 153951, 104800, 105301]

    @Published var plants = [PlantDetailModel]()

    var loading: Bool {
        self.plants.count != self.plantIds.count
    }
    var cancellable: [AnyCancellable]?

    init() {
        print("bruh")
        self.cancellable = self.plantIds.map { id in
            self.trefleService.fetchPlant(id).sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { detailContainer in
                self.plants.append(PlantDetailModel(detailContainer))
            })
        }
    }
}
