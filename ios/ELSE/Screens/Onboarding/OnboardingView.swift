import SwiftUI

/// Pixel-tuned to `designs/first_launch_onboarding`
struct OnboardingView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ElseCanvas { metrics in
            ZStack {
                ElseTheme.canvas.ignoresSafeArea()
                Circle()
                    .fill(ElseTheme.primaryContainer.opacity(0.22))
                    .frame(width: metrics.size.width * 0.72)
                    .blur(radius: 70)
                    .offset(y: -metrics.size.height * 0.22)
                Circle()
                    .fill(ElseTheme.secondaryContainer.opacity(0.12))
                    .frame(width: metrics.size.width * 0.6)
                    .blur(radius: 55)
                    .offset(x: metrics.size.width * 0.28, y: metrics.size.height * 0.05)

                VStack(spacing: 0) {
                    runtimePill(metrics)
                        .padding(.top, 8)

                    Spacer(minLength: metrics.sectionGap)

                    ElseFlexibleColumn(metrics: metrics) {
                        hero(metrics)
                    }

                    Spacer(minLength: metrics.sectionGap)

                    ElseFlexibleColumn(metrics: metrics) {
                        footer(metrics)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private func runtimePill(_ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 10) {
            Circle().fill(ElseTheme.primary).frame(width: 10, height: 10)
            Text("ELSE Optical Engine")
                .font(ElseType.caption(.semibold, scale: metrics.typeScale))
            Text("Ready")
                .font(ElseType.labelCaps(scale: metrics.typeScale))
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(ElseTheme.surfaceContainerHigh, in: Capsule())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(ElseTheme.surfaceContainerLowest, in: Capsule())
        .shadow(color: .black.opacity(0.35), radius: 12, y: 6)
    }

    private func hero(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(spacing: 14) {
            HStack(spacing: 6) {
                Image(systemName: "sparkles").foregroundStyle(ElseTheme.primary)
                Text("Instant Decision Copilot")
                    .font(ElseType.labelCaps(scale: metrics.typeScale))
                    .tracking(1.4)
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                    .textCase(.uppercase)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .elseGlassCapsule()

            OpticalApertureMark(size: 64 * metrics.typeScale)

            Text("ELSE")
                .font(ElseType.verdictXL(scale: metrics.typeScale))
                .tracking(-1)
                .foregroundStyle(ElseTheme.onSurface)

            Text("Point at anything.\nGet a second opinion.")
                .font(ElseType.headlineMD(scale: metrics.typeScale))
                .multilineTextAlignment(.center)
                .foregroundStyle(ElseTheme.onSurface)
                .frame(maxWidth: .infinity)

            Text("See it. Ask it. Know what to do.")
                .font(ElseType.bodyLG(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .multilineTextAlignment(.center)

            // Spatial reticle preview card — mirrors Stitch mid hero
            ZStack {
                RoundedRectangle(cornerRadius: ElseTheme.radiusMd, style: .continuous)
                    .fill(ElseTheme.surfaceContainerHigh)
                    .frame(height: metrics.isCompactHeight ? 140 : 180)
                VStack {
                    HStack {
                        Text("Spatial Reticle Active")
                            .font(ElseType.labelCaps(scale: metrics.typeScale))
                            .foregroundStyle(ElseTheme.primary)
                            .textCase(.uppercase)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(ElseTheme.surfaceContainerLowest.opacity(0.8), in: Capsule())
                        Spacer()
                        Text("4K · 60FPS")
                            .font(ElseType.caption(scale: metrics.typeScale))
                            .foregroundStyle(ElseTheme.onSurfaceVariant)
                    }
                    Spacer()
                    OpticalApertureMark(size: 56)
                    Spacer()
                    HStack {
                        Label("Target Lock", systemImage: "viewfinder")
                        Spacer()
                        Label("Private", systemImage: "lock.fill")
                    }
                    .font(ElseType.caption(scale: metrics.typeScale))
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                }
                .padding(14)
            }
            .frame(maxWidth: .infinity)

            VStack(alignment: .leading, spacing: 10) {
                feature("eye", "No cloud storage required", metrics)
                feature("lock.fill", "Processed on-device wherever supported", metrics)
                feature("person.crop.circle.badge.xmark", "Zero account, zero passwords, zero tracking", metrics)
                feature("bolt.fill", "Verdicts arrive in milliseconds", metrics)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(ElseTheme.surfaceContainerLow.opacity(0.6), in: RoundedRectangle(cornerRadius: ElseTheme.radiusDefault, style: .continuous))
        }
    }

    private func feature(_ icon: String, _ text: String, _ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(ElseTheme.primary)
                .frame(width: 22)
            Text(text)
                .font(ElseType.bodyMD(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func footer(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(spacing: 12) {
            Text("ELSE needs your camera to see what you're asking about.")
                .font(ElseType.caption(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)

            PrimaryPillButton(title: "Continue with Camera", systemImage: "camera.fill") {
                router.completeOnboarding()
            }
            SecondaryGlassButton(title: "Try ELSE") {
                router.completeOnboarding()
            }

            Text("Apple Camera Sandboxed Access • Strict Local Session")
                .font(ElseType.labelCaps(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.labelTertiary)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
        }
    }
}
