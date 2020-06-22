import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            if self.viewModel.loading {
                HStack {
                    Spacer()
                    ActivityIndicator()
                    Text("Loading...")
                    Spacer()
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
                    ScrollView {
                        ColumnView(self.viewModel.plants) { item in
                            Text("\(item.name)")
                        }
                    }
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
