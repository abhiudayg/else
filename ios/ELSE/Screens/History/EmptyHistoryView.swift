import SwiftUI

/// Mirrors `empty_history_else`
struct EmptyHistoryView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "shield")
                .font(.system(size: 44))
                .foregroundStyle(ElseTheme.primary)
            Text("Your ELSE")
                .font(ElseType.headlineMD())
            Text("Your decisions will appear here.")
                .font(ElseType.bodyLG())
                .foregroundStyle(ElseTheme.onSurfaceVariant)

            VStack(alignment: .leading, spacing: 12) {
                Text("Try inquiring about")
                    .font(ElseType.caption())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                idea("Which shirt should I wear?", "Contrast analysis & occasion fit")
                idea("Do I need to sign this notice?", "Instant document breakdown & deadlines")
                idea("Should I buy these shoes?", "Value check & style continuity review")
            }
            .padding(16)
            .elseGlassCard()
            .padding(.horizontal, ElseTheme.margin)

            PrimaryPillButton(title: "Ask ELSE something", systemImage: "camera.fill") {
                router.popToRoot()
            }
            .padding(.horizontal, ElseTheme.margin)

            Text("Encrypted on-device in Secure Enclave. Zero tracking.")
                .font(ElseType.labelCaps())
                .foregroundStyle(ElseTheme.labelTertiary)
                .textCase(.uppercase)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(ElseTheme.background.ignoresSafeArea())
        .navigationTitle("Empty History")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func idea(_ q: String, _ sub: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("“\(q)”").font(ElseType.bodyMD(.semibold))
                Text(sub).font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
            Spacer()
            Image(systemName: "arrow.right").foregroundStyle(ElseTheme.primary)
        }
    }
}
