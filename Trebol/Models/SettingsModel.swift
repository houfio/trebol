import Foundation

struct SettingsModel {
    var isDark: Bool = true {
        willSet {
            print("wifi status will change")
        }
    }
}
