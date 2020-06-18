import SwiftUI

struct CollectionView: View {
    @EnvironmentObject public var collection: Collection
    
    var body: some View {
        VStack {
            Title(title: "Plant collection")
            
            ForEach(self.collection.getPlants(), id: \.id) { plant in
                Text("\(plant.id)")
            }
            
            Spacer()
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
