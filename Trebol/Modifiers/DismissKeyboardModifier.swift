import SwiftUI

struct DismissKeyboardModifier: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.windows
            .filter { window in
                window.isKeyWindow
            }
            .first?
            .endEditing(true)
    }

    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
