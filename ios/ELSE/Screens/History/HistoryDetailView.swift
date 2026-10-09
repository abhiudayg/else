import SwiftUI

/// Mirrors `history_detail_shoes_decision`
struct HistoryDetailView: View {
    @Environment(AppRouter.self) private var router
    let decision: ContextObject

    var body: some View {
        ElseScrollScreen(title: "Verdict Deep Dive") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                HStack {
                    Label("SoHo Boutique", systemImage: "storefront")
                    Spacer()
                    Text("Confidence: Likely")
                        .font(ElseType.labelCaps())
                        .foregroundStyle(ElseTheme.statusAmber)
                        .textCase(.uppercase)
                }
                .font(ElseType.caption())
                .foregroundStyle(ElseTheme.onSurfaceVariant)

                Text("Common Projects Achilles Low Match")
                    .font(ElseType.headlineSM())

                Text(decision.verdict)
                    .font(ElseType.verdictXL())
                    .foregroundStyle(ElseTheme.labelPrimary)

                Text("Second Opinion synthesized across wardrobe catalog and historical spend.")
                    .font(ElseType.bodyMD())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)

                Text("“\(decision.reason)”")
                    .font(ElseType.bodyLG())
                    .italic()
                    .padding(16)
                    .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)

                contextCard
                redundancy
                Text("Captured Yesterday, 4:18 PM · Apple on-device")
                    .font(ElseType.caption())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)

                PrimaryPillButton(title: "Ask Follow-up Question", systemImage: "text.bubble") {}
                HStack {
                    SecondaryGlassButton(title: "Edit notes") {}
                    Button(role: .destructive) {} label: {
                        Label("Delete", systemImage: "trash")
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .foregroundStyle(ElseTheme.error)
                            .elseGlassCapsule(fill: Color.red.opacity(0.12))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 8)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { router.push(.shareVerdict) } label: { Image(systemName: "square.and.arrow.up") }
            }
        }
    }

    private var contextCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Temporal Context Match", systemImage: "clock.arrow.circlepath")
                .font(ElseType.title())
            Text("You considered these shoes 3 weeks earlier at a lower price point")
                .font(ElseType.bodyMD())
            Text("+29.7% price markup detected since your last scan.")
                .font(ElseType.caption(.semibold))
                .foregroundStyle(ElseTheme.statusAmber)
        }
        .padding(16)
        .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
    }

    private var redundancy: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Catalog Redundancy").font(ElseType.title())
            Text("88% Similarity").font(ElseType.headlineSM()).foregroundStyle(ElseTheme.primary)
            HStack {
                shoe("Artisan Low Tops", "$240 · Unworn", "Scanned")
                shoe("Oliver Cabell Low 1", "White · 14 wears", "Owned")
            }
        }
        .padding(16)
        .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
    }

    private func shoe(_ name: String, _ meta: String, _ badge: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 12).fill(ElseTheme.surfaceContainerHigh).frame(height: 72)
            Text(badge).font(ElseType.labelCaps()).foregroundStyle(ElseTheme.primary).textCase(.uppercase)
            Text(name).font(ElseType.caption(.semibold))
            Text(meta).font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
