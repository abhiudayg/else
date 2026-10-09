import SwiftUI

/// Mirrors `my_own_model_else`
struct MyOwnModelView: View {
    @State private var endpoint = "api.anthropic.com/v1/messages"
    @State private var token = ""
    @State private var verified = true

    var body: some View {
        ElseScrollScreen(title: "My Own Model") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                Text("Custom Inference Engine")
                    .font(ElseType.headlineSM())
                Text("Route ELSE perceptual verdicts directly through your personal high-parameter weights or on-prem cluster.")
                    .font(ElseType.bodyMD())
                    .foregroundStyle(ElseTheme.onSurfaceVariant)

                Text("Target Provider").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
                HStack {
                    provider("Claude", true)
                    provider("GPT-4o", false)
                    provider("Ollama", false)
                }

                field("Endpoint URL", $endpoint)
                HStack {
                    Image(systemName: "lock.fill")
                    Text("TLS 1.3 Certified").font(ElseType.caption())
                    Spacer()
                    Text("Zero Proxy").font(ElseType.labelCaps()).foregroundStyle(ElseTheme.primary).textCase(.uppercase)
                }

                Text("Runtime Credentials").font(ElseType.title())
                SecureField("API Authorization Token", text: $token)
                    .textFieldStyle(.plain)
                    .padding(14)
                    .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)

                HStack {
                    SecondaryGlassButton(title: "Paste") { }
                    PrimaryPillButton(title: "Verify Handshake", systemImage: "bolt.fill") { verified = true }
                }

                if verified {
                    HStack {
                        Image(systemName: "checkmark.seal.fill").foregroundStyle(ElseTheme.statusGreen)
                        Text("Connection Verified · 62ms RTT").font(ElseType.caption(.semibold))
                    }
                    .padding(12)
                    .elseGlassCapsule()
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Model Parameter Bounds").font(ElseType.title())
                    HStack {
                        Text("Active Weight").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
                        Spacer()
                        Text("Claude 3.7 Sonnet (Extended Reasoning)").font(ElseType.bodyMD(.semibold))
                    }
                    HStack {
                        Text("Context Allocator")
                        Spacer()
                        Text("128k Tokens")
                    }
                    .font(ElseType.bodyMD())
                    Text("Minimum 32k · Maximum 200k")
                        .font(ElseType.caption())
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                    Toggle("Visual Multimodal Feed", isOn: .constant(true))
                        .tint(ElseTheme.primaryContainer)
                    Text("Inject high-res camera frame tensors")
                        .font(ElseType.caption())
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                }
                .padding(16)
                .elseGlassCard()
            }
            .padding(.top, 8)
        }
    }

    private func provider(_ name: String, _ selected: Bool) -> some View {
        Text(name)
            .font(ElseType.caption(.semibold))
            .foregroundStyle(selected ? ElseTheme.onPrimary : ElseTheme.onSurface)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(selected ? ElseTheme.primaryContainer : ElseTheme.glassThin, in: Capsule())
    }

    private func field(_ title: String, _ text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            TextField(title, text: text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(14)
                .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
        }
    }
}
