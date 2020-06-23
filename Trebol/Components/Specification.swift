import SwiftUI

struct Specification<T: LosslessStringConvertible>: View {
    private let name: String
    private let value: T?
    private let divider: Bool

    init(_ name: String, value: T?, divider: Bool = true) {
        self.name = name
        self.value = value
        self.divider = divider
    }

    var body: some View {
        VStack {
            HStack {
                Text(self.name)
                Spacer()
                Text(self.value != nil ? String(self.value!) : "-")
            }
                .padding(.top, 4)
            if self.divider {
                Divider()
            }
        }
    }
}

struct Specification_Previews: PreviewProvider {
    static var previews: some View {
        Specification("Test", value: 1)
    }
}
