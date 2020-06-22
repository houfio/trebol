import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if self.viewModel.loading {
                    HStack {
                        ActivityIndicator()
                        Text("Loading...")
                    }
                } else {
                    VStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(self.viewModel.plants[0..<3], id: \.self) { plant in
                                    Card(plant)
                                }
                            }
                        }
                        ForEach(self.viewModel.plants[3...], id: \.self) { plant in
                            Text("\(plant.name)")
                        }
                    }
                        .frame(width: geometry.size.width)
                }
            }
                .navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
