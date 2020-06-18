import SwiftUI

struct ContentView: View {
    @ObservedObject var collection = Collection()
    @State private var tab = 1
    
    var body: some View {
        TabView(selection: $tab) {
            Tab(icon: "house", tag: 1) {
                HomeView()
            }
            
            Tab(icon: "magnifyingglass", tag: 2) {
                SearchView()
            }
            
            Tab(icon: "tray.full", tag: 3) {
                CollectionView()
            }
            
            Tab(icon: "gear", tag: 4) {
                SettingsView()
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
