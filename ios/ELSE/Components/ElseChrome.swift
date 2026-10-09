import SwiftUI

struct ElseWordmarkCapsule: View {
    var version: String = "v2.4"
    var scale: CGFloat = 1

    var body: some View {
        HStack(spacing: 8) {
            Text("ELSE")
                .font(ElseType.headlineSM(.black, scale: scale))
                .foregroundStyle(ElseTheme.onSurface)
            Circle()
                .fill(ElseTheme.primary)
                .frame(width: 6, height: 6)
            Text(version)
                .font(ElseType.labelCaps(scale: scale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .tracking(1.2)
                .textCase(.uppercase)
        }
        .padding(.horizontal, 14)
        .frame(height: 40)
        .elseGlassCapsule()
    }
}

struct GlassIconButton: View {
    let systemName: String
    var size: CGFloat = 40
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: size * 0.42, weight: .medium))
                .foregroundStyle(ElseTheme.onSurface)
                .frame(width: size, height: size)
                .contentShape(Circle())
                .elseGlassCapsule()
        }
        .buttonStyle(.plain)
        .frame(minWidth: 44, minHeight: 44)
    }
}

struct JobChipRow: View {
    @Binding var job: ElseJob?
    var scale: CGFloat = 1

    var body: some View {
        HStack(spacing: 0) {
            ForEach(ElseJob.allCases) { j in
                Button {
                    job = (job == j ? nil : j)
                } label: {
                    Text(j.rawValue)
                        .font(ElseType.caption(.semibold, scale: scale))
                        .foregroundStyle(job == j ? ElseTheme.onSurface : ElseTheme.onSurfaceVariant)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .background {
                            if job == j {
                                Capsule().fill(ElseTheme.surfaceBright.opacity(0.45))
                            }
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .elseGlassCapsule(fill: ElseTheme.surfaceContainerHigh.opacity(0.8))
    }
}

struct EngineChip: View {
    let label: String
    var scale: CGFloat = 1
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "lock.fill")
                .font(.system(size: 10 * scale))
            Text(label)
                .font(ElseType.labelCaps(scale: scale))
                .textCase(.uppercase)
                .tracking(0.8)
                .lineLimit(1)
        }
        .foregroundStyle(ElseTheme.onSurfaceVariant)
        .padding(.horizontal, 10)
        .frame(height: 28)
        .elseGlassCapsule(fill: ElseTheme.surfaceContainerLow.opacity(0.7))
    }
}

struct PrimaryPillButton: View {
    let title: String
    var systemImage: String? = nil
    var fill: Color = ElseTheme.indigo
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let systemImage {
                    Image(systemName: systemImage)
                }
                Text(title)
                    .font(ElseType.bodyLG(.semibold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background {
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [fill, ElseTheme.systemBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.white.opacity(0.35), lineWidth: 0.5)
                    }
            }
        }
        .buttonStyle(.plain)
    }
}

struct SecondaryGlassButton: View {
    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(ElseType.bodyLG(.semibold))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.85)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .elseGlassCapsule(fill: ElseTheme.glassThin)
        }
        .buttonStyle(.plain)
    }
}

/// Stitch bottom nav: `h-16 max-w-md mx-auto` with `flex-1` equal tabs.
struct BottomNavBar: View {
    @Binding var selected: CaptureTab
    var metrics: ElseLayoutMetrics
    var onSelect: (CaptureTab) -> Void = { _ in }

    var body: some View {
        ElseFlexibleColumn(metrics: metrics) {
            HStack(spacing: 0) {
                ForEach(CaptureTab.allCases) { tab in
                    Button {
                        selected = tab
                        onSelect(tab)
                    } label: {
                        VStack(spacing: 2) {
                            Image(systemName: icon(for: tab))
                                .font(.system(size: 18 * metrics.typeScale, weight: .medium))
                            Text(tab.rawValue)
                                .font(ElseType.labelCaps(scale: metrics.typeScale))
                                .textCase(.uppercase)
                                .tracking(0.6)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }
                        .foregroundStyle(selected == tab ? ElseTheme.primary : ElseTheme.onSurfaceVariant)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            if selected == tab {
                                Capsule()
                                    .fill(ElseTheme.surfaceBright.opacity(0.4))
                                    .overlay {
                                        Capsule()
                                            .strokeBorder(Color.white.opacity(0.2), lineWidth: 0.5)
                                    }
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(4)
            .frame(height: metrics.bottomNavHeight)
            .frame(maxWidth: .infinity)
            .elseGlassCapsule(fill: ElseTheme.surfaceContainerHigh.opacity(0.8))
            .shadow(color: .black.opacity(0.45), radius: 16, y: 8)
        }
    }

    private func icon(for tab: CaptureTab) -> String {
        switch tab {
        case .scan: "camera.fill"
        case .verdicts: "checkmark.seal.fill"
        case .advisors: "bubble.left.and.bubble.right.fill"
        case .vault: "lock.shield.fill"
        }
    }
}

struct ElseScrollScreen<Content: View>: View {
    var title: String? = nil
    @ViewBuilder var content: (ElseLayoutMetrics) -> Content

    var body: some View {
        ElseCanvas { metrics in
            ScrollView {
                ElseFlexibleColumn(metrics: metrics) {
                    content(metrics)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, metrics.sectionGap + 24)
                }
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle(title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}
