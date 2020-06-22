import SwiftUI
import UIKit

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var onSearch: () -> Void

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        var onSearch: () -> Void

        init(text: Binding<String>, onSearch: @escaping () -> Void) {
            self._text = text
            self.onSearch = onSearch
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.onSearch()
            searchBar.endEditing(true)
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(text: self.$text, onSearch: self.onSearch)
    }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)

        searchBar.placeholder = self.placeholder
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal

        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<Self>) {
        uiView.text = text
    }
}
