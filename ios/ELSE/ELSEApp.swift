import SwiftUI

@main
struct ELSEApp: App {
    @State private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(router)
                .preferredColorScheme(.dark)
                .tint(ElseTheme.primary)
        }
    }
}
