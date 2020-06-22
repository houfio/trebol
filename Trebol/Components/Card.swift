import SwiftUI
import URLImage

struct Card: View {
    private let plant: PlantDetailModel

    init(_ plant: PlantDetailModel) {
        self.plant = plant
    }

    var body: some View {
        ZStack {
            URLImage(URL(string: self.plant.image)!) { proxy in
                proxy.image
                    .resizable()
                    .scaledToFill()
            }
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom))
                .opacity(0.75)
            VStack {
                Spacer()
                HStack {
                    Text("Plant")
                    Text(self.plant.name)
                    Spacer()
                }
                .padding()
            }
        }
        .frame(width: 350, height: 250)
        .cornerRadius(22)
        .shadow(radius: 8)
        .padding()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(PlantDetailModel(PlantDetailContainer(id: 0, scientificName: "Test", images: [])))
    }
}
