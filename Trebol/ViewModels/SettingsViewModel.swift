import Foundation
import SwiftUI
import Combine

class SettingsViewModel: ObservableObject, Identifiable {
    @Published public var darkMode: Bool = false {
        didSet {
            UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = oldValue ? .light : .dark
        }
    }
}
