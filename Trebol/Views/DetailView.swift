import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel

    init(_ viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            if self.viewModel.plant != nil {
                VStack {
                    if !self.viewModel.plant!.species.isEmpty {
                        HStack {
                            Text("More like this")
                                .font(.headline)
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(self.viewModel.plant!.species, id: \.self) { plant in
                                    SmallCard(name: plant.name)
                                        .padding()
                                }
                            }
                        }
                    }
                }
            } else {
                HStack {
                    Spacer()
                    ActivityIndicator()
                    Text("Loading...")
                    Spacer()
                }
                    .padding()
            }
        }
        .navigationBarTitle(self.viewModel.plant!.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            DetailViewModel(
                plant: PlantModel(
                    PlantContainer(
                        id: 142722,
                        scientificName: "Scientific name"
                    )
                )
            )
        )
    }
}
