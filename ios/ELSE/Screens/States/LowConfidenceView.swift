import SwiftUI

/// Mirrors `low_confidence_else`
struct LowConfidenceView: View {
    var body: some View {
        ElseScrollScreen(title: "Optical Analysis") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                Text("CONFIDENCE: AMBIGUOUS")
                    .font(ElseType.labelCaps())
                    .foregroundStyle(ElseTheme.statusAmber)
                    .tracking(1)
                Text("I’m not certain.")
                    .font(ElseType.verdictXL())

                HStack {
                    match("Cotton Twill", "64% Match")
                    match("Linen Blend", "58% Match")
                }

                VStack(alignment: .leading, spacing: 10) {
                    Label("Next Step Resolution", systemImage: "view.3d")
                        .font(ElseType.title())
                    Text("A photo from a second angle or closer fabric weave would help me decide.")
                        .font(ElseType.bodyMD())
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                    PrimaryPillButton(title: "Add Second Angle", systemImage: "plus") {}
                    SecondaryGlassButton(title: "Ask anyway") {}
                }
                .padding(16)
                .elseGlassCard()

                Text("Suggested Inquiries").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
                inquiry("sun.max", "Is it for warm weather?")
                inquiry("tag", "Check label instead")
                inquiry("drop", "Synthetic blend test")
            }
            .padding(.top, 8)
        }
    }

    private func match(_ title: String, _ pct: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(ElseType.bodyLG(.semibold))
            Text(pct).font(ElseType.caption()).foregroundStyle(ElseTheme.primary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
    }

    private func inquiry(_ icon: String, _ title: String) -> some View {
        Label(title, systemImage: icon)
            .font(ElseType.bodyMD(.medium))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14)
            .elseGlassCapsule()
    }
}
