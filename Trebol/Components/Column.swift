import SwiftUI

struct Column<T: Hashable, Content: View>: View {
    private let items: [T]
    private let content: (_ item: T) -> Content
    
    init(_ items: [T], content: @escaping (_ item: T) -> Content) {
        self.items = items
        self.content = content
    }
    
    private func groupedItems() -> [[T]] {
        var groupedItems: [[T]] = []

        _ = self.items
                .publisher
                .collect(2)
                .collect()
                .sink(receiveValue: { value in
                    groupedItems = value
                })
 
        return groupedItems
    }
    
    var body: some View {
        ForEach(self.groupedItems(), id: \.self) { group in
            HStack() {
                ForEach(group, id: \.self) { item in
                    self.content(item)
                }
                
                if group.count == 1 {
                    VStack() {
                        Spacer()
                    }
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Column([PlantDetailContainer(id: 0, scientificName: "Test", images: [])]) { item in
            Text("Lol!")
        }
    }
}
