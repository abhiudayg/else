import SwiftUI

enum AppRoute: Hashable {
    case onboarding
    case signIn
    case capture
    case verdictDecide
    case verdictAct
    case secondOpinion
    case history
    case emptyHistory
    case historyDetail
    case engineSettings
    case myOwnModel
    case privacyMemory
    case shareVerdict
    case blurryError
    case lowConfidence
    case offline
    case logo
    case stitchGallery
}

@Observable
final class AppRouter {
    var path: [AppRoute] = []
    var hasCompletedOnboarding: Bool = UserDefaults.standard.bool(forKey: "else.onboarding.done")
    var selectedTab: CaptureTab = .scan

    func completeOnboarding() {
        hasCompletedOnboarding = true
        UserDefaults.standard.set(true, forKey: "else.onboarding.done")
    }

    func push(_ route: AppRoute) { path.append(route) }
    func pop() { if !path.isEmpty { path.removeLast() } }
    func popToRoot() { path.removeAll() }
}

enum CaptureTab: String, CaseIterable, Identifiable {
    case scan = "Scan"
    case verdicts = "Verdicts"
    case advisors = "Advisors"
    case vault = "Vault"
    var id: String { rawValue }
}
