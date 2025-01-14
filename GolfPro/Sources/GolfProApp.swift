import SwiftUI

@main
struct GolfProApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: .init())
        }
    }
}
