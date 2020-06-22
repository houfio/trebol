import SwiftUI

struct DismissKeyboardModifier: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.windows
            .filter {
                $0.isKeyWindow
            }
            .first?
            .endEditing(true)
    }

    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
