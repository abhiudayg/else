import SwiftUI

/// Mirrors `verdict_act_document`
struct VerdictActView: View {
    @Environment(AppRouter.self) private var router
    let decision: ContextObject

    var body: some View {
        ElseScrollScreen(title: "Verdicts") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                savedToast
                documentPreview
                verdictBlock
                countdown
                primaryActions
                nextSteps
            }
            .padding(.top, 8)
        }
    }

    private var savedToast: some View {
        HStack {
            Image(systemName: "checkmark.circle.fill").foregroundStyle(ElseTheme.statusGreen)
            Text("Saved to Vault").font(ElseType.caption(.semibold))
            Spacer()
            Button("Undo") {}
                .font(ElseType.caption(.semibold))
                .foregroundStyle(ElseTheme.primary)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .elseGlassCapsule()
        .padding(.top, 8)
    }

    private var documentPreview: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Detected Clause §4.2", systemImage: "viewfinder")
                .font(ElseType.caption(.semibold))
                .foregroundStyle(ElseTheme.primary)
            Text("\"All items must be returned within 14 calendar days of receipt...\"")
                .font(ElseType.bodyMD())
                .foregroundStyle(ElseTheme.onSurface)
            HStack {
                EngineChip(label: "Apple on-device")
                Spacer()
                Text("99.4% Match")
                    .font(ElseType.labelCaps())
                    .foregroundStyle(ElseTheme.statusGreen)
                    .textCase(.uppercase)
            }
        }
        .padding(16)
        .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
    }

    private var verdictBlock: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Action Required")
                .font(ElseType.labelCaps())
                .foregroundStyle(ElseTheme.statusAmber)
                .textCase(.uppercase)
            Text("Notice Ref: #882-QX")
                .font(ElseType.caption())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text(decision.verdict)
                .font(ElseType.verdictXL())
                .foregroundStyle(ElseTheme.labelPrimary)
            Text(decision.reason)
                .font(ElseType.bodyLG())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .padding(20)
        .elseGlassCard()
    }

    private var countdown: some View {
        HStack {
            Image(systemName: "hourglass").foregroundStyle(ElseTheme.tertiary)
            VStack(alignment: .leading, spacing: 2) {
                Text("6 Days Remaining").font(ElseType.bodyLG(.semibold))
                Text("Standard ground post window · Tuesday 5:00 PM EST")
                    .font(ElseType.caption())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
            }
        }
        .padding(14)
        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
    }

    private var primaryActions: some View {
        HStack(spacing: 10) {
            PrimaryPillButton(title: "Remind me", systemImage: "alarm") {}
            SecondaryGlassButton(title: "Add to Calendar") {}
        }
    }

    private var nextSteps: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Suggested Next Steps")
                .font(ElseType.caption())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            step("envelope", "Draft response email")
            step("shippingbox", "Find nearest drop-off")
            Button {
                router.push(.secondOpinion)
            } label: {
                Label("Ask another model", systemImage: "brain.head.profile")
                    .font(ElseType.bodyMD(.semibold))
                    .foregroundStyle(ElseTheme.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(14)
                    .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
            }
            .buttonStyle(.plain)
        }
    }

    private func step(_ icon: String, _ title: String) -> some View {
        Label(title, systemImage: icon)
            .font(ElseType.bodyMD(.medium))
            .foregroundStyle(ElseTheme.onSurface)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14)
            .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
    }
}
