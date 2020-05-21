import SwiftUI

struct ContentView: View {
    @State private var tab = 1
    
    var body: some View {
        TabView(selection: $tab) {
            HomeView().tabItem {
                Image(systemName: "house").font(.system(size: 22))
            }.tag(1)
            
            CollectionView().tabItem {
                Image(systemName: "tray.full").font(.system(size: 22))
            }.tag(2)
            
            SettingsView().tabItem {
                Image(systemName: "gear").font(.system(size: 22))
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
