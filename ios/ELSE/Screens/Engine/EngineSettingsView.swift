import SwiftUI

/// Mirrors `engine_settings_providers`
struct EngineSettingsView: View {
    @Environment(AppRouter.self) private var router
    @State private var mode: EngineMode = .automatic

    var body: some View {
        ElseScrollScreen(title: "Scenario Settings") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                runtimeHeader
                Text("Computation Pipeline")
                    .font(ElseType.title())
                modeRow(.automatic, "Recommended", "Use Apple’s intelligence automatically and choose the best available processing method.", "sparkles")
                modeRow(.onDeviceOnly, nil, "Keep processing on this iPhone whenever possible. Zero bytes leave your device.", "lock.fill")
                modeRow(.myOwnModel, nil, "For users who want to bring their own AI provider via custom API keys.", "point.3.connected.trianglepath.dotted") {
                    router.push(.myOwnModel)
                }
                aneStrip
                customProviders
                Button { router.push(.stitchGallery) } label: {
                    Label("Stitch Screen Gallery", systemImage: "rectangle.3.group")
                        .font(ElseType.bodyLG(.semibold))
                        .foregroundStyle(ElseTheme.onSurface)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
                }
                .buttonStyle(.plain)

                Button { router.push(.privacyMemory) } label: {
                    Label("Privacy & Memory", systemImage: "hand.raised.fill")
                        .font(ElseType.bodyLG(.semibold))
                        .foregroundStyle(ElseTheme.onSurface)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 8)
        }
    }

    private var runtimeHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Active Runtime", systemImage: "brain.head.profile")
                .font(ElseType.caption())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text("Neural Mesh Hybrid")
                .font(ElseType.headlineSM())
            HStack {
                Text("Ready").font(ElseType.labelCaps()).foregroundStyle(ElseTheme.statusGreen).textCase(.uppercase)
                Spacer()
                Text("iOS 27 Core").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
        }
        .padding(16)
        .elseGlassCard()
    }

    private func modeRow(_ value: EngineMode, _ badge: String?, _ subtitle: String, _ icon: String, onSelect: (() -> Void)? = nil) -> some View {
        Button {
            mode = value
            onSelect?()
        } label: {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: icon)
                    .foregroundStyle(ElseTheme.primary)
                    .frame(width: 24)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(value.rawValue).font(ElseType.bodyLG(.semibold)).foregroundStyle(ElseTheme.onSurface)
                        if let badge {
                            Text(badge)
                                .font(ElseType.labelCaps())
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(ElseTheme.primary.opacity(0.2), in: Capsule())
                                .foregroundStyle(ElseTheme.primary)
                                .textCase(.uppercase)
                        }
                    }
                    Text(subtitle).font(ElseType.bodyMD()).foregroundStyle(ElseTheme.onSurfaceVariant).multilineTextAlignment(.leading)
                }
                Spacer()
                if mode == value {
                    Image(systemName: "checkmark.circle.fill").foregroundStyle(ElseTheme.primary)
                }
            }
            .padding(16)
            .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
        }
        .buttonStyle(.plain)
    }

    private var aneStrip: some View {
        HStack {
            Image(systemName: "memorychip")
            VStack(alignment: .leading) {
                Text("Apple Neural Engine 16-Core").font(ElseType.bodyMD(.semibold))
                Text("38 TOPS Latency Floor • 0.4ms").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
        }
        .padding(14)
        .elseGlassCapsule()
    }

    private var customProviders: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Custom Engine Provider").font(ElseType.title())
            Text("v2.4 Spec · Target Architecture").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            HStack {
                ForEach(["Claude", "GPT-4o", "Local Ollama"], id: \.self) { name in
                    Text(name)
                        .font(ElseType.caption(.semibold))
                        .padding(.horizontal, 12)
                        .frame(height: 32)
                        .elseGlassCapsule()
                }
            }
        }
        .padding(16)
        .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
    }
}
