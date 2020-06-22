import SwiftUI

struct Tab<Content: View>: View {
    var icon: String
    var label: String
    var tag: Int
    let content: () -> Content

    var body: some View {
        NavigationView() {
            self.content()
        }
            .tabItem {
                VStack {
                    Image(systemName: self.icon)
                        .font(.system(size: 22))
                    Text(self.label)
                }
            }
            .tag(self.tag)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        TabView() {
            Tab(icon: "house", label: "Home", tag: 0) {
                VStack {
                    Text("Hello, World!")
                        .navigationBarTitle("Navigation")
                    Spacer()
                }
            }
        }
    }
}
