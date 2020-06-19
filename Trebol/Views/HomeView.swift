import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            Title(title: "Home")

            if !self.viewModel.plants.isEmpty {
                ScrollView {
                    ForEach(self.viewModel.plants, id: \.id) { plant in
                        Card(plant: plant)
                    }
                }
            } else {
                Spacer()
                ActivityIndicator()
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
