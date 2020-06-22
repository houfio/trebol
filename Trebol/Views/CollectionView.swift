import SwiftUI

struct CollectionView: View {
    @EnvironmentObject private var collectionViewModel: CollectionViewModel

    var body: some View {
        VStack {
            if self.collectionViewModel.plants.isEmpty {
                Text("You don't have any collected plants yet! Add some plants to your collection to see them here 🌿")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                Spacer()
            } else {
                ScrollView {
                    Column(self.collectionViewModel.plants) { item in
                        SmallCard(item.name)
                    }
                }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 10)
            }
        }
        .navigationBarTitle(Text("Collection"))
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
