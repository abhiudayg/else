import SwiftUI

/// Mirrors `blurry_photo_error_else`
struct BlurryPhotoErrorView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            ElseTheme.canvas.ignoresSafeArea()
            VStack(spacing: 20) {
                HStack {
                    Label("Unresolved Focal Plane", systemImage: "camera.metering.unknown")
                    Spacer()
                    Text("ELSE • VIZ 27").font(ElseType.labelCaps()).foregroundStyle(ElseTheme.onSurfaceVariant)
                }
                .font(ElseType.caption(.semibold))
                .padding(.horizontal)

                Spacer()
                Image(systemName: "camera.filters")
                    .font(.system(size: 56))
                    .foregroundStyle(ElseTheme.tertiary)
                Text("Optical Defocus Detected")
                    .font(ElseType.headlineSM())
                Text("I can't read the small print.")
                    .font(ElseType.bodyLG())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                Text("Tip: Tap screen to lock optical macro focus.")
                    .font(ElseType.caption())
                    .foregroundStyle(ElseTheme.labelTertiary)
                Spacer()
                VStack(spacing: 12) {
                    PrimaryPillButton(title: "Retake Photo", systemImage: "camera.fill") { dismiss() }
                    SecondaryGlassButton(title: "Ask anyway") { dismiss() }
                }
                .padding(.horizontal, ElseTheme.margin)
                .padding(.bottom, 28)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { dismiss() } label: { Image(systemName: "xmark") }
            }
        }
    }
}
