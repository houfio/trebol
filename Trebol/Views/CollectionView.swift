import SwiftUI

struct CollectionView: View {
    @EnvironmentObject private var collectionService: CollectionService
    
    var body: some View {
        VStack {
            if self.collectionService.getPlants().count == 0 {
                Text("You don't have any collected plants yet! Add some plants to your collection to see them here 🌿")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                Spacer()
            } else {
                ScrollView {
                    ColumnView(self.collectionService.getPlants()) { item in
                        SmallCard(item.name)
                    }
                }
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
