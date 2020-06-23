import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let trefleService = TrefleService()

    @Published var plant: PlantDetailModel?

    var cancellable: AnyCancellable?
    var model: PlantModel?

    init(plant: PlantModel? = nil, detail: PlantDetailModel? = nil) {
        self.model = plant
        self.plant = detail
    }

    func fetchDetails() {
        if (self.plant == nil && self.model != nil) {
            self.cancellable = self.trefleService.fetchPlant(self.model!.id).sink(receiveCompletion: { completion in
                print("detail \(completion)")
            }, receiveValue: { detailContainer in
                self.plant = PlantDetailModel(detailContainer)
            })
        }
    }
}
