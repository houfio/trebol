import SwiftUI

struct ContentView: View {
    @State private var tab = 1
    
    var body: some View {
        TabView(selection: $tab) {
            Tab(icon: "house", tag: 1) {
                HomeView()
            }
            
            Tab(icon: "tray.full", tag: 2) {
                CollectionView()
            }
            
            Tab(icon: "gear", tag: 3) {
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
