import SwiftUI

struct HomeView: View {
    @State private var favorited = false
    
    var body: some View {
        VStack {
            Title(title: "Home")

            ScrollView {
                Card(favorited: self.$favorited, family: "Tree", scientificName: "Kalolaw minoqie", name: "Apple tree with leaves", header: "plant")
                Card(favorited: self.$favorited, family: "Tree", scientificName: "Kalolaw minoqie", name: "Apple tree with leaves", header: "plant")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
