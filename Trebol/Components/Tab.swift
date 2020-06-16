import SwiftUI

struct Tab<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    public var icon: String
    public var tag: Int
    public let viewBuilder: () -> Content
    
    var body: some View {
        ZStack {
            Color(self.colorScheme == .dark ? UIColor.black : UIColor.systemGray6)
                .edgesIgnoringSafeArea(.all)
        
            self.viewBuilder()
        }.tabItem {
            Image(systemName: self.icon)
                .font(.system(size: 22))
        }.tag(self.tag)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab(icon: "house", tag: 1) {
            HomeView()
        }
    }
}
