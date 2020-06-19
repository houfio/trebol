import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    public let size: CGFloat = 1.5
    
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView()
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
        uiView.transform = CGAffineTransform(scaleX: self.size, y: self.size);
    }
}
