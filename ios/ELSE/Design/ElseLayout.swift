import SwiftUI

/// Flexible layout metrics so screens scale from SE-class to Pro Max without fixed phone frames.
struct ElseLayoutMetrics: Sendable {
    var size: CGSize
    var safeArea: EdgeInsets

    /// Design artboards are ~390–430pt wide; larger phones get centered content.
    var contentMaxWidth: CGFloat { min(430, size.width) }

    var horizontalPadding: CGFloat {
        let base = size.width * 0.042
        return min(24, max(16, base))
    }

    var sectionGap: CGFloat {
        min(28, max(16, size.height * 0.02))
    }

    /// Scale relative to iPhone 15 width (393). Clamped for readability.
    var typeScale: CGFloat {
        min(1.12, max(0.94, size.width / 393))
    }

    var shutterSize: CGFloat {
        min(78, max(64, size.width * 0.17))
    }

    var bottomNavHeight: CGFloat { 64 }

    var isCompactHeight: Bool { size.height < 750 }
}

struct ElseCanvas<Content: View>: View {
    @ViewBuilder var content: (ElseLayoutMetrics) -> Content

    var body: some View {
        GeometryReader { geo in
            let metrics = ElseLayoutMetrics(size: geo.size, safeArea: geo.safeAreaInsets)
            content(metrics)
                .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
        }
        .background(ElseTheme.canvas.ignoresSafeArea())
    }
}

/// Centers a flexible column up to `contentMaxWidth` — Stitch `max-w-md mx-auto`.
struct ElseFlexibleColumn<Content: View>: View {
    var metrics: ElseLayoutMetrics
    @ViewBuilder var content: () -> Content

    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            content()
                .frame(maxWidth: metrics.contentMaxWidth, alignment: .top)
                .padding(.horizontal, metrics.horizontalPadding)
            Spacer(minLength: 0)
        }
    }
}

extension View {
    func elseScaledFont(_ base: CGFloat, weight: Font.Weight = .regular, metrics: ElseLayoutMetrics) -> some View {
        font(.system(size: base * metrics.typeScale, weight: weight))
    }
}
