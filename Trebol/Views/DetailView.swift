import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel
    @ObservedObject private var collectionViewModel: CollectionViewModel

    init(_ viewModel: DetailViewModel, collectionViewModel: CollectionViewModel) {
        self.viewModel = viewModel
        self.collectionViewModel = collectionViewModel
    }

    var body: some View {
        ScrollView {
            if self.viewModel.plant != nil {
                VStack {
                    if !(self.viewModel.plant?.images.isEmpty ?? true) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.viewModel.plant?.images[0..<10] ?? [], id: \.self) { image in
                                    PlantImage(image)
                                        .padding(4)
                                }
                            }
                                .padding(.horizontal, 8)
                        }
                    }
                    HStack {
                        Text("Collection")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            self.collectionViewModel.toggle(self.viewModel.plant!)
                        }) {
                            Text(self.collectionViewModel.contains(self.viewModel.plant!) ? "Remove" : "Add")
                        }
                    }
                        .padding(.horizontal)
                    if !(self.viewModel.plant?.species.isEmpty ?? true) {
                        HStack {
                            Text("Species")
                                .font(.headline)
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(self.viewModel.plant?.species ?? [], id: \.self) { plant in
                                    SmallCard(name: plant.name)
                                        .padding(4)
                                }
                            }
                                .padding(.horizontal, 8)
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
            .navigationBarTitle(self.viewModel.plant?.name ?? "")
            .onAppear {
                self.viewModel.fetchDetails()
            }
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
            ),
            collectionViewModel: CollectionViewModel()
        )
    }
}
