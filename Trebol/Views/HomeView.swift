import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Title(title: "Home")

            ScrollView {
                VStack {
                    ForEach(self.viewModel.plants, id: \.id) { plant in
                        Card(plant: plant)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
