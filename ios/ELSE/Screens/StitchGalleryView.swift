import SwiftUI

/// Dev gallery: every Stitch screen reachable for visual QA.
struct StitchGalleryView: View {
    @Environment(AppRouter.self) private var router

    private let routes: [(String, AppRoute)] = [
        ("first_launch_onboarding", .onboarding),
        ("sign_in_with_apple_else", .signIn),
        ("capture_primary_home", .capture),
        ("verdict_decide_clothes", .verdictDecide),
        ("verdict_act_document", .verdictAct),
        ("second_opinion_comparison", .secondOpinion),
        ("your_else_history", .history),
        ("empty_history_else", .emptyHistory),
        ("history_detail_shoes_decision", .historyDetail),
        ("engine_settings_providers", .engineSettings),
        ("my_own_model_else", .myOwnModel),
        ("privacy_memory_else", .privacyMemory),
        ("shareable_verdict_card_else", .shareVerdict),
        ("blurry_photo_error_else", .blurryError),
        ("low_confidence_else", .lowConfidence),
        ("offline_else", .offline),
        ("else_refined_optical_aperture_logo", .logo),
    ]

    var body: some View {
        List {
            ForEach(routes, id: \.0) { name, route in
                Button(name) { router.push(route) }
                    .foregroundStyle(ElseTheme.onSurface)
            }
        }
        .scrollContentBackground(.hidden)
        .background(ElseTheme.background)
        .navigationTitle("Stitch Gallery")
    }
}
