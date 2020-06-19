import Foundation
import Combine
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    public let placeHolder: String?
    public let onSearch: () -> Void

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        public let onSearch: () -> Void

        init(text: Binding<String>, onSearch: @escaping () -> Void) {
            self._text = text
            self.onSearch = onSearch
        }

        public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }
        
        public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.onSearch()
            searchBar.endEditing(true)
        }
        
        public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.endEditing(true)
        }
    }

    public func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: self.$text, onSearch: self.onSearch)
    }

    public func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = self.placeHolder
        return searchBar
    }

    public func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = self.text
    }
}
