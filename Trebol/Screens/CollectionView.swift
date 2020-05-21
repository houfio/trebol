import SwiftUI

struct CollectionView: View {
    var body: some View {
        VStack {
            Title(title: "Plant collection")
            Spacer()
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
