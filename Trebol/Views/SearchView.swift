import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }

    var body: some View {
        List {
            Section(header: SearchBar(text: self.$viewModel.search, placeholder: "Search plants", onSearch: self.viewModel.fetchPlants)) {
                ForEach(self.viewModel.plants, id: \.self) { plant in
                    Row(plant.name)
                }
                if self.viewModel.loading {
                    HStack {
                        ActivityIndicator()
                        Text("Loading...")
                    }
                        .padding(.horizontal)
                }
            }
                .padding(.horizontal, 6)
                .listRowInsets(.init())
                .background(Color(.systemBackground))
        }
            .navigationBarTitle(Text("Search"))
            .modifier(DismissKeyboardModifier())
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
