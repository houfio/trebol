import SwiftUI
import URLImage

struct PlantImage: View {
    private var image: String
    
    init(_ image: String) {
        self.image = image
    }
    
    var body: some View {
        URLImage(URL(string: self.image)!) { proxy in
            proxy.image
                .resizable()
                .scaledToFill()
                .frame(width: 320, height: 180)
                .clipped()
                .cornerRadius(14)
        }
        .frame(width: 320, height: 180)
        .cornerRadius(28)
    }
}

struct PlantImage_Previews: PreviewProvider {
    static var previews: some View {
        PlantImage("https://tinyurl.com/yarufx3b")
    }
}
