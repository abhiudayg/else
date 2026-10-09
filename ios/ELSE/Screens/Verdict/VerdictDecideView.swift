import SwiftUI

/// Pixel-tuned to `designs/verdict_decide_clothes`
struct VerdictDecideView: View {
    @Environment(AppRouter.self) private var router
    let decision: ContextObject

    var body: some View {
        ElseScrollScreen(title: "Verdicts") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                optionPills(metrics)
                affinityStrip(metrics)
                verdictCard(metrics)
                factors(metrics)
                actions(metrics)
                followUps(metrics)
            }
            .padding(.top, 8)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { router.push(.history) } label: { Image(systemName: "clock.arrow.circlepath") }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button { router.push(.signIn) } label: { Image(systemName: "person.crop.circle") }
            }
        }
    }

    private func optionPills(_ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 8) {
            pill("Option A: Navy Wool", true, metrics)
            pill("Option B: Black Twill", false, metrics)
        }
    }

    private func pill(_ text: String, _ active: Bool, _ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 6) {
            Circle()
                .fill(active ? ElseTheme.primary : ElseTheme.outline)
                .frame(width: 8, height: 8)
            Text(text)
                .font(ElseType.labelCaps(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurface)
                .textCase(.uppercase)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity)
        .elseGlassCapsule(fill: active ? ElseTheme.surfaceContainerHigh.opacity(0.8) : ElseTheme.surfaceContainerLow.opacity(0.7))
    }

    private func affinityStrip(_ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "hanger").foregroundStyle(ElseTheme.primary)
            Text("Wardrobe Affinity")
                .font(ElseType.caption(.semibold, scale: metrics.typeScale))
            Spacer(minLength: 8)
            Text("Synchronized with 38 cataloged items")
                .font(ElseType.caption(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
                .minimumScaleFactor(0.85)
        }
        .padding(12)
        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
    }

    private func verdictCard(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Very likely")
                    .font(ElseType.labelCaps(scale: metrics.typeScale))
                    .foregroundStyle(ElseTheme.statusGreen)
                    .textCase(.uppercase)
                Spacer()
                EngineChip(label: "Apple on-device", scale: metrics.typeScale)
            }
            Text("Recommended Decision")
                .font(ElseType.caption(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text(decision.verdict)
                .font(ElseType.verdictXL(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.labelPrimary)
                .tracking(-0.8)
                .fixedSize(horizontal: false, vertical: true)
            Text("“\(decision.reason)”")
                .font(ElseType.bodyLG(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .italic()
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .elseGlassCard()
    }

    private func factors(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Key Influencing Factors", systemImage: "slider.horizontal.3")
                .font(ElseType.title(scale: metrics.typeScale))
            factor("Versatility:", "Navy coordinates with 74% of your registered trousers (grey flannel, khaki, raw denim).", metrics)
            factor("Formality Curve:", "Black twill reads strictly formal or evening wear under warm indoor lighting.", metrics)
            factor("Seasonal Lifespan:", "Four-season wearability vs. high-contrast winter/night wear.", metrics)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
    }

    private func factor(_ title: String, _ body: String, _ metrics: ElseLayoutMetrics) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title).font(ElseType.bodyLG(.semibold, scale: metrics.typeScale))
            Text(body).font(ElseType.bodyMD(scale: metrics.typeScale)).foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func actions(_ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 10) {
            actionBtn("Why?", "text.magnifyingglass", metrics) {}
            actionBtn("2nd Opinion", "arrow.triangle.branch", metrics) { router.push(.secondOpinion) }
            actionBtn("Share", "square.and.arrow.up", metrics) { router.push(.shareVerdict) }
        }
    }

    private func actionBtn(_ title: String, _ icon: String, _ metrics: ElseLayoutMetrics, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                Text(title)
                    .font(ElseType.caption(.semibold, scale: metrics.typeScale))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .foregroundStyle(ElseTheme.onSurface)
            .frame(maxWidth: .infinity)
            .frame(height: 64)
            .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
        }
        .buttonStyle(.plain)
    }

    private func followUps(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Explore Scenarios")
                .font(ElseType.caption(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            chip("What if it's for work?", metrics)
            chip("What about the black one?", metrics)
        }
    }

    private func chip(_ text: String, _ metrics: ElseLayoutMetrics) -> some View {
        HStack {
            Text(text).font(ElseType.bodyMD(.medium, scale: metrics.typeScale))
            Spacer()
            Image(systemName: "arrow.right")
        }
        .foregroundStyle(ElseTheme.onSurface)
        .padding(14)
        .frame(maxWidth: .infinity)
        .elseGlassCapsule(fill: ElseTheme.glassThin)
    }
}
