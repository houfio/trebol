import SwiftUI

struct SettingsView: View {
    @State private var darkMode = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Title(title: "Settings")
            
            VStack {
                Toggle(isOn: $darkMode) {
                    Text("Enable darkmode")
                }
                .padding()
            }
            .background(self.colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
