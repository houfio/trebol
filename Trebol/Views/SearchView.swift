import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel = SearchViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = self.colorScheme == .dark ? UIColor.black : UIColor.systemGray6
        UITableViewCell.appearance().backgroundColor = self.colorScheme == .dark ? UIColor.black : UIColor.systemGray6
    }
    
    var body: some View {
        VStack {
            Title(title: "Search")
            
            SearchBar(
                text: self.$viewModel.text,
                placeHolder: "Search plant",
                onSearch: self.viewModel.searchPlants
            )
            
            List(self.viewModel.plants, id: \.id) { plant in
                Text(plant.scientificName)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
