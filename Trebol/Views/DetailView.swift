import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel

    init(_ viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            if self.viewModel.plant != nil {
                Text(self.viewModel.plant!.name)
            } else {
                HStack {
                    Spacer()
                    ActivityIndicator()
                    Text("Loading...")
                    Spacer()
                }
                    .padding()
            }
        }
            .navigationBarTitle("Plant")
    }
}
