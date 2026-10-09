import AppIntents

struct AskELSEIntent: AppIntent {
    static let title: LocalizedStringResource = "Ask ELSE"
    static let description = IntentDescription("Open ELSE capture for a second opinion.")

    func perform() async throws -> some IntentResult {
        .result()
    }
}

struct ELSEShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AskELSEIntent(),
            phrases: [
                "Ask \(.applicationName) about this",
                "Open \(.applicationName) camera"
            ],
            shortTitle: "Ask ELSE",
            systemImageName: "camera.viewfinder"
        )
    }
}
