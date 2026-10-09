import SwiftUI

/// Pixel-tuned to `designs/capture_primary_home` — flex column + max-width chrome.
struct CaptureHomeView: View {
    @Environment(AppRouter.self) private var router
    @State private var job: ElseJob? = nil
    @State private var selectedTab: CaptureTab = .scan

    var body: some View {
        ElseCanvas { metrics in
            ZStack {
                cameraPlane
                VStack(spacing: 0) {
                    topChrome(metrics)
                    promptBubble(metrics)
                        .padding(.top, metrics.isCompactHeight ? 8 : 16)
                    Spacer(minLength: 0)
                    bottomStack(metrics)
                }
                .padding(.top, 4)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private var cameraPlane: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(hex: 0x4A463F),
                    Color(hex: 0x2C2A26),
                    Color(hex: 0x0E0E0E)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Soft “sneaker” stand-ins so the viewfinder feels populated like Stitch
            HStack(spacing: 24) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: 0xD8D2C8), Color(hex: 0xA8A094)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .aspectRatio(0.85, contentMode: .fit)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: 0xE8E4DC), Color(hex: 0xB8B2A6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .aspectRatio(0.9, contentMode: .fit)
            }
            .padding(.horizontal, 36)
            .frame(maxHeight: 280)
            .opacity(0.9)

            LinearGradient(
                colors: [
                    Color.black.opacity(0.55),
                    Color.clear,
                    Color.clear,
                    Color.black.opacity(0.78)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .allowsHitTesting(false)

            recognitionOverlays
        }
    }

    private func topChrome(_ metrics: ElseLayoutMetrics) -> some View {
        ElseFlexibleColumn(metrics: metrics) {
            HStack(spacing: 8) {
                ElseWordmarkCapsule(scale: metrics.typeScale)
                Spacer(minLength: 8)
                GlassIconButton(systemName: "flashlight.on.fill")
                GlassIconButton(systemName: "magnifyingglass") {
                    router.push(.history)
                }
            }
        }
    }

    private func promptBubble(_ metrics: ElseLayoutMetrics) -> some View {
        ElseFlexibleColumn(metrics: metrics) {
            HStack {
                Spacer(minLength: 0)
                HStack(spacing: 8) {
                    Image(systemName: "circle.hexagongrid.fill")
                        .foregroundStyle(ElseTheme.primary)
                    Text("What are you unsure about?")
                        .font(ElseType.bodyMD(.medium, scale: metrics.typeScale))
                        .foregroundStyle(ElseTheme.onSurface)
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .elseGlassCapsule(fill: ElseTheme.surfaceContainerLow.opacity(0.75))
                Spacer(minLength: 0)
            }
        }
    }

    private var recognitionOverlays: some View {
        GeometryReader { geo in
            let boxW = geo.size.width * 0.38
            let boxH = geo.size.height * 0.18
            ZStack(alignment: .topLeading) {
                recognitionBox(
                    title: "Item A · 98%",
                    subtitle: "Matte Leather",
                    badge: nil,
                    glow: ElseTheme.primary.opacity(0.18)
                )
                .frame(width: boxW, height: boxH)
                .offset(x: geo.size.width * 0.08, y: geo.size.height * 0.30)

                recognitionBox(
                    title: "Item B · Canvas",
                    subtitle: nil,
                    badge: "ELSE sees it",
                    glow: ElseTheme.primaryContainer.opacity(0.28)
                )
                .frame(width: geo.size.width * 0.42, height: boxH * 1.1)
                .offset(x: geo.size.width * 0.50, y: geo.size.height * 0.34)

                Image(systemName: "plus")
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(ElseTheme.primary.opacity(0.4))
                    .position(x: geo.size.width / 2, y: geo.size.height * 0.42)
            }
        }
        .allowsHitTesting(false)
    }

    private func recognitionBox(title: String, subtitle: String?, badge: String?, glow: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            if let badge {
                HStack(spacing: 4) {
                    Image(systemName: "sparkles")
                    Text(badge)
                }
                .font(ElseType.caption(.semibold))
                .foregroundStyle(ElseTheme.onPrimaryContainer)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(ElseTheme.primaryContainer, in: Capsule())
            }
            HStack(spacing: 4) {
                Circle().fill(ElseTheme.primary).frame(width: 6, height: 6)
                Text(title)
                    .font(ElseType.labelCaps())
                    .foregroundStyle(ElseTheme.primary)
                    .textCase(.uppercase)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(ElseTheme.surfaceContainerHigh.opacity(0.8), in: Capsule())
            Spacer(minLength: 0)
            if let subtitle {
                Text(subtitle)
                    .font(ElseType.caption())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.black.opacity(0.4), in: Capsule())
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(6)
        .background(glow, in: RoundedRectangle(cornerRadius: ElseTheme.radiusDefault, style: .continuous))
    }

    private func bottomStack(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(spacing: 10) {
            ElseFlexibleColumn(metrics: metrics) {
                compareTray(metrics)
                JobChipRow(job: $job, scale: metrics.typeScale)
                shutterRow(metrics)
            }
            BottomNavBar(selected: $selectedTab, metrics: metrics) { tab in
                switch tab {
                case .verdicts: router.push(.history)
                case .vault: router.push(.privacyMemory)
                case .advisors: router.push(.secondOpinion)
                case .scan: break
                }
            }
            .padding(.bottom, 6)
        }
    }

    private func compareTray(_ metrics: ElseLayoutMetrics) -> some View {
        HStack(spacing: 10) {
            HStack(spacing: 8) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: 0xE8E4DC), Color(hex: 0xA8A094)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 32, height: 32)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(ElseTheme.primary)
                            .frame(width: 10, height: 10)
                            .overlay(Circle().stroke(ElseTheme.surface, lineWidth: 1))
                    }
                Button {} label: {
                    Image(systemName: "plus")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 32, height: 32)
                        .background(ElseTheme.surfaceBright.opacity(0.5), in: Circle())
                }
                .buttonStyle(.plain)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Compare")
                        .font(ElseType.caption(.semibold, scale: metrics.typeScale))
                    Text("1 of 3 shots queued")
                        .font(ElseType.labelCaps(scale: metrics.typeScale))
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                        .textCase(.uppercase)
                }
            }
            Spacer(minLength: 8)
            Button {
                router.push(.verdictDecide)
            } label: {
                HStack(spacing: 4) {
                    Text("Synthesize")
                    Image(systemName: "arrow.right")
                }
                .font(ElseType.caption(.semibold, scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.primary)
                .padding(.horizontal, 12)
                .frame(height: 28)
                .background(ElseTheme.primary.opacity(0.2), in: Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .elseGlassCapsule(fill: ElseTheme.surfaceContainerHigh.opacity(0.7))
    }

    private func shutterRow(_ metrics: ElseLayoutMetrics) -> some View {
        HStack(alignment: .center, spacing: 0) {
            inputGlyph("photo.on.rectangle", "Roll", metrics) {}
            inputGlyph("rectangle.on.rectangle", "Snap", metrics) {}
            Button {
                router.push(.verdictDecide)
            } label: {
                ZStack {
                    Circle()
                        .fill(ElseTheme.primary.opacity(0.2))
                        .frame(width: metrics.shutterSize + 20, height: metrics.shutterSize + 20)
                        .blur(radius: 8)
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [ElseTheme.surfaceBright, ElseTheme.surface],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay {
                            Circle()
                                .strokeBorder(Color.white.opacity(0.45), lineWidth: 2)
                        }
                        .frame(width: metrics.shutterSize, height: metrics.shutterSize)
                    Circle()
                        .fill(ElseTheme.onSurface)
                        .frame(width: metrics.shutterSize * 0.55, height: metrics.shutterSize * 0.55)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Scan shutter")
            inputGlyph("doc.on.clipboard", "Paste", metrics) {}
            inputGlyph("mic.fill", "Voice", metrics) {}
        }
        .padding(.vertical, 4)
    }

    private func inputGlyph(_ icon: String, _ label: String, _ metrics: ElseLayoutMetrics, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 18 * metrics.typeScale))
                    .frame(width: 44, height: 36)
                Text(label)
                    .font(ElseType.labelCaps(scale: metrics.typeScale))
                    .textCase(.uppercase)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
            }
            .foregroundStyle(ElseTheme.onSurfaceVariant)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}
