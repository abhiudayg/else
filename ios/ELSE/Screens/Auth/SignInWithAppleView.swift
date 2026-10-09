import AuthenticationServices
import SwiftUI

/// Pixel-tuned to `designs/sign_in_with_apple_else`
struct SignInWithAppleView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ElseCanvas { metrics in
            VStack(spacing: 0) {
                Spacer(minLength: metrics.sectionGap)
                ElseFlexibleColumn(metrics: metrics) {
                    VStack(spacing: 20) {
                        OpticalApertureMark(size: 80 * metrics.typeScale)
                        Text("ELSE")
                            .font(ElseType.verdictXL(scale: metrics.typeScale))
                            .foregroundStyle(ElseTheme.onSurface)
                        Text("See it. Ask it. Know what to do.")
                            .font(ElseType.bodyLG(scale: metrics.typeScale))
                            .foregroundStyle(ElseTheme.onSurfaceVariant)
                            .multilineTextAlignment(.center)
                        Text("iOS 27 Apple Intelligence Native")
                            .font(ElseType.labelCaps(scale: metrics.typeScale))
                            .tracking(1)
                            .foregroundStyle(ElseTheme.primary)
                            .textCase(.uppercase)

                        VStack(alignment: .leading, spacing: 14) {
                            benefit("checkmark.shield.fill", "Private Decision Vault", "Hardware-bound Secure Enclave isolated", metrics)
                            benefit("eye.slash.fill", "Zero Telemetry Tracking", "No ad identifiers, accounts optional", metrics)
                            benefit("brain.head.profile", "Instant Optical Inference", "Sub-millisecond on-device neural verdict", metrics)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .elseGlassCard()
                    }
                }
                Spacer(minLength: metrics.sectionGap)
                ElseFlexibleColumn(metrics: metrics) {
                    VStack(spacing: 12) {
                        SignInWithAppleButton(.signIn) { _ in } onCompletion: { _ in
                            router.popToRoot()
                            router.completeOnboarding()
                        }
                        .signInWithAppleButtonStyle(.white)
                        .frame(height: 52)
                        .clipShape(Capsule())

                        SecondaryGlassButton(title: "Continue with Passkey or Face ID") {
                            router.completeOnboarding()
                        }
                        Button("Try without account (On-Device Only)") {
                            router.completeOnboarding()
                        }
                        .font(ElseType.bodyMD(.semibold, scale: metrics.typeScale))
                        .foregroundStyle(ElseTheme.primary)

                        Text("Apple Secure Enclave Guaranteed")
                            .font(ElseType.labelCaps(scale: metrics.typeScale))
                            .foregroundStyle(ElseTheme.labelTertiary)
                            .textCase(.uppercase)

                        HStack(spacing: 16) {
                            Text("Terms of Service")
                            Text("Privacy Manifesto")
                        }
                        .font(ElseType.caption(scale: metrics.typeScale))
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                    }
                }
                .padding(.bottom, 28)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private func benefit(_ icon: String, _ title: String, _ subtitle: String, _ metrics: ElseLayoutMetrics) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(ElseTheme.primary)
                .frame(width: 24)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(ElseType.bodyLG(.semibold, scale: metrics.typeScale)).foregroundStyle(ElseTheme.onSurface)
                Text(subtitle).font(ElseType.caption(scale: metrics.typeScale)).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
