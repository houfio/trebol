import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    @EnvironmentObject private var collectionViewModel: CollectionViewModel

    var body: some View {
        ScrollView {
            if self.viewModel.loading {
                HStack {
                    Spacer()
                    ActivityIndicator()
                    Text("Loading...")
                    Spacer()
                }
                    .padding()
            } else {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.viewModel.plants[0..<3], id: \.self) { plant in
                                Card(plant)
                                    .padding()
                            }
                        }
                    }
                    HStack {
                        Text("Popular")
                            .font(.headline)
                            .padding(.horizontal)
                        Spacer()
                    }
                    ScrollView {
                        Column(self.viewModel.plants) { item in
                            SmallCard(item.name)
                                .onTapGesture {
                                    self.collectionViewModel.add(item)
                                }
                        }
                    }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 10)
                }
            }
        }
            .navigationBarTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
