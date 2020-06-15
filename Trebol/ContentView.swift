import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var tab = 1
    
    var body: some View {
        TabView(selection: $tab) {
            ZStack {
                Color(self.colorScheme == .dark ? UIColor.black : UIColor.systemGray6)
                    .edgesIgnoringSafeArea(.all)
            
                HomeView()
            }.tabItem {
                Image(systemName: "house").font(.system(size: 22))
            }.tag(1)
            
            ZStack {
                Color(self.colorScheme == .dark ? UIColor.black : UIColor.systemGray6)
                    .edgesIgnoringSafeArea(.all)
            
                CollectionView()
            }.tabItem {
                Image(systemName: "tray.full").font(.system(size: 22))
            }.tag(2)
            
            ZStack {
                Color(self.colorScheme == .dark ? UIColor.black : UIColor.systemGray6)
                    .edgesIgnoringSafeArea(.all)
            
                SettingsView()
            }.tabItem {
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
