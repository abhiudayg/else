import SwiftUI

/// Mirrors `else_refined_optical_aperture_logo`
struct LogoMarkView: View {
    var body: some View {
        ZStack {
            ElseTheme.canvas.ignoresSafeArea()
            VStack(spacing: 24) {
                OpticalApertureMark(size: 160)
                Text("ELSE")
                    .font(ElseType.verdictXL())
                    .tracking(-1.2)
                    .foregroundStyle(ElseTheme.onSurface)
                Text("SECOND OPINION")
                    .font(ElseType.labelCaps())
                    .tracking(2)
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
            }
        }
    }
}

struct OpticalApertureMark: View {
    var size: CGFloat = 48

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(ElseTheme.primary.opacity(0.35), lineWidth: size * 0.04)
                .frame(width: size, height: size)
            ForEach(0..<6, id: \.self) { i in
                Capsule()
                    .fill(ElseTheme.primary.opacity(0.85))
                    .frame(width: size * 0.08, height: size * 0.28)
                    .offset(y: -size * 0.22)
                    .rotationEffect(.degrees(Double(i) * 60))
            }
            Circle()
                .fill(ElseTheme.primaryContainer)
                .frame(width: size * 0.22, height: size * 0.22)
                .shadow(color: ElseTheme.primary.opacity(0.5), radius: 8)
        }
        .accessibilityLabel("ELSE optical aperture logo")
    }
}

#Preview { LogoMarkView() }
