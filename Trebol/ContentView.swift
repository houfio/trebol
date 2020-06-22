import SwiftUI
import Combine

struct ContentView: View {
    private var collectionViewModel = CollectionViewModel()

    init() {
        UINavigationBar.appearance().backgroundColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    var body: some View {
        TabView() {
            Tab(icon: "house", label: "Home", tag: 0) {
                HomeView()
            }
            Tab(icon: "magnifyingglass", label: "Search", tag: 1) {
                SearchView()
            }
            Tab(icon: "tray", label: "Collection", tag: 2) {
                CollectionView()
            }
        }
            .accentColor(Color(.systemGreen))
            .environmentObject(self.collectionViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
