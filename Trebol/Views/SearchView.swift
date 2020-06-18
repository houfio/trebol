import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            Title(title: "Search")
            
            SearchBar(
                text: $searchText,
                placeHolder: "Search plant",
                onSearch: self.viewModel.searchPlants(text: self.searchText)
            )
            
            List(self.viewModel.plants, id: \.id) { plant in
                Text(plant.scientificName)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
