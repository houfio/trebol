import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: SettingsViewModel
    
    init() {
        self.viewModel = SettingsViewModel()
    }
    
    var body: some View {
        VStack {
            Title(title: "Settings")
            
            Toggle(isOn: $viewModel.darkMode) {
                Image(systemName: "moon")
                
                Text("Dark mode")
                    .bold()
            }
            .padding()
            .background(self.colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white)
            .cornerRadius(10)
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
