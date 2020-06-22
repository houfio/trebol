import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let trefleService = TrefleService()

    @Published var plant: PlantDetailModel?

    var cancellable: AnyCancellable?

    init(plant: PlantModel? = nil, detail: PlantDetailModel? = nil) {
        guard let data = detail else {
            self.cancellable = self.trefleService.fetchPlant(plant!.id).sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { detailContainer in
                self.plant = PlantDetailModel(detailContainer)
            })

            return
        }

        self.plant = data
    }
}
