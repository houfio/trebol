import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()

    init() {
        UITableView.appearance().separatorColor = .clear
    }

    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { g in
                    ZStack {
                        Blur()
                            .opacity(Double(88 - g.frame(in: .global).minY) / 52 + 1)
                        SearchBar(text: self.$viewModel.search, placeholder: "Search plants", onSearch: self.viewModel.fetchPlants)
                    }
                        .offset(x: 0, y: g.frame(in: .global).minY < 88 ? -g.frame(in: .global).minY + 88 : 0)
                }
                    .frame(height: 55)
                    .zIndex(1)
                if self.viewModel.loading {
                    HStack {
                        ActivityIndicator()
                        Text("Loading...")
                    }
                } else {
                    ForEach(self.viewModel.plants, id: \.self) { plant in
                        Row(plant)
                    }
                }
            }
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
