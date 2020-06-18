import SwiftUI

struct HomeView: View {
    @State private var favorited = false
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Title(title: "Home")

            ScrollView {
                VStack {
                    ForEach(self.viewModel.plants, id: \.id) { plant in
                        Card(favorited: self.$favorited, family: plant.slug, scientificName: plant.scientificName, name: "Common", header: "plant")
                            .padding()
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
