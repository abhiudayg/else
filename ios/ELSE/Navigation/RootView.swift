import SwiftUI

struct RootView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.path) {
            Group {
                if router.hasCompletedOnboarding {
                    CaptureHomeView()
                } else {
                    OnboardingView()
                }
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .onboarding: OnboardingView()
                case .signIn: SignInWithAppleView()
                case .capture: CaptureHomeView()
                case .verdictDecide: VerdictDecideView(decision: StitchFixtures.decideClothes)
                case .verdictAct: VerdictActView(decision: StitchFixtures.actDocument)
                case .secondOpinion: SecondOpinionView()
                case .history: HistoryView(items: StitchFixtures.sampleHistory)
                case .emptyHistory: EmptyHistoryView()
                case .historyDetail: HistoryDetailView(decision: StitchFixtures.shoesSkip)
                case .engineSettings: EngineSettingsView()
                case .myOwnModel: MyOwnModelView()
                case .privacyMemory: PrivacyMemoryView()
                case .shareVerdict: ShareVerdictView(decision: StitchFixtures.decideClothes)
                case .blurryError: BlurryPhotoErrorView()
                case .lowConfidence: LowConfidenceView()
                case .offline: OfflineView()
                case .logo: LogoMarkView()
                case .stitchGallery: StitchGalleryView()
                }
            }
        }
        .background(ElseTheme.canvas.ignoresSafeArea())
    }
}
