import SwiftUI

struct LiquidGlassCapsule: ViewModifier {
    var fill: Color = ElseTheme.surfaceContainerHigh.opacity(0.65)

    func body(content: Content) -> some View {
        content
            .background {
                Capsule()
                    .fill(.ultraThinMaterial)
                    .overlay {
                        Capsule()
                            .fill(fill)
                    }
                    .overlay {
                        Capsule()
                            .strokeBorder(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.28),
                                        Color.white.opacity(0.05)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),
                                lineWidth: 0.5
                            )
                    }
            }
    }
}

struct LiquidGlassCard: ViewModifier {
    var cornerRadius: CGFloat = ElseTheme.radiusLg

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(ElseTheme.glassPanel)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .strokeBorder(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.28),
                                        Color.white.opacity(0.05)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),
                                lineWidth: 0.5
                            )
                    }
            }
    }
}

extension View {
    func elseGlassCapsule(fill: Color = ElseTheme.surfaceContainerHigh.opacity(0.65)) -> some View {
        modifier(LiquidGlassCapsule(fill: fill))
    }

    func elseGlassCard(cornerRadius: CGFloat = ElseTheme.radiusLg) -> some View {
        modifier(LiquidGlassCard(cornerRadius: cornerRadius))
    }

    func elseScrim() -> some View {
        overlay {
            LinearGradient(
                colors: [
                    Color.black.opacity(0.4),
                    Color.clear,
                    Color.clear,
                    Color.black.opacity(0.6)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .allowsHitTesting(false)
        }
    }
}
