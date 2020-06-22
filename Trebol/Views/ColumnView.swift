import SwiftUI

struct ColumnView<T: Hashable, Content: View>: View {
    let items: [T]
    let content: (_ item: T) -> Content
    
    private func groupedItems() -> [[T]] {
        var groupedItems: [[T]] = []
        
        _ = self.items
                .publisher
                .collect(2)
                .collect()
                .sink(receiveValue: { groupedItems = $0 })
        
        return groupedItems
    }
    
    var body: some View {
        ForEach(self.groupedItems(), id: \.self) { group in
            HStack {
                ForEach(group, id: \.self) { item in
                    self.content(item)
                }
            }
        }
    }
}

struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnView(items: [PlantDetailContainer(id: 0, scientificName: "Test", images: [])]) { item in
            Text("Lol!")
        }
    }
}
