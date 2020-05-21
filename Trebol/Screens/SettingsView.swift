import SwiftUI

struct SettingsView: View {
    @State private var darkMode = true
    
    var body: some View {
        VStack {
            Title(title: "Settings")
            Toggle(isOn: $darkMode) {
                Text("Darkmode")
            }.padding()
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
