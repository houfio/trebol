import SwiftUI

struct ContentView: View {
    @ObservedObject var collection = Collection()
    @State private var tab = 1
    
    var body: some View {
        TabView(selection: $tab) {
            Tab(icon: "house", label: "Home", tag: 1) {
                HomeView()
            }
            
            Tab(icon: "magnifyingglass", label: "Search", tag: 2) {
                SearchView()
            }
            
            Tab(icon: "tray.full", label: "Collection", tag: 3) {
                CollectionView()
            }
        }
        .environmentObject(self.collection)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
