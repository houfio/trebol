import SwiftUI

struct ContentView: View {
    @State private var tab = 1
    
    var body: some View {
        TabView(selection: $tab) {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }.tag(1)
            
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
