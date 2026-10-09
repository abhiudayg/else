import SwiftUI

/// Mirrors `privacy_memory_else`
struct PrivacyMemoryView: View {
    @State private var memoryOn = true

    var body: some View {
        ElseScrollScreen(title: "Privacy & Memory") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                HStack {
                    Image(systemName: "checkmark.shield.fill").foregroundStyle(ElseTheme.statusGreen)
                    Text("Hardware Vault Secure")
                        .font(ElseType.caption(.semibold))
                        .foregroundStyle(ElseTheme.statusGreen)
                }

                Text("Persistent Memory Engine")
                    .font(ElseType.headlineSM())

                Toggle(isOn: $memoryOn) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Decision Memory").font(ElseType.bodyLG(.semibold))
                        Text("ELSE uses your previous decisions to make future answers more contextual and accurate.")
                            .font(ElseType.bodyMD())
                            .foregroundStyle(ElseTheme.onSurfaceVariant)
                    }
                }
                .tint(ElseTheme.primaryContainer)
                .padding(16)
                .elseGlassCard()

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Active Biases & Insights").font(ElseType.title())
                        Spacer()
                        Text("3 calibrated").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
                    }
                    bias("Neutral Color Affinity (88%)")
                    bias("Minimalist Footwear Preference")
                    bias("Weekend Casual Wear Bias")
                }
                .padding(16)
                .elseGlassCard(cornerRadius: ElseTheme.radiusMd)

                Text("Your Data Controls").font(ElseType.title())
                control("lock.open", "View Decision Memory Vault", "412 items")
                control("curlybraces", "Export Data as JSON", nil)
                control("clock.arrow.circlepath", "Clear Recent 30 Days", nil)
                Button(role: .destructive) {} label: {
                    Label("Delete All Decisions & Embeddings", systemImage: "trash.fill")
                        .font(ElseType.bodyMD(.semibold))
                        .foregroundStyle(ElseTheme.error)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(14)
                        .background(Color.red.opacity(0.12), in: RoundedRectangle(cornerRadius: ElseTheme.radiusDefault, style: .continuous))
                }
                .buttonStyle(.plain)

                VStack(alignment: .leading, spacing: 10) {
                    Text("AI Telemetry & Optical Pipeline").font(ElseType.title())
                    HStack {
                        Label("Apple Silicon Sandbox", systemImage: "memorychip")
                        Spacer()
                        Text("Zero external bytes").font(ElseType.caption()).foregroundStyle(ElseTheme.statusGreen)
                    }
                    HStack {
                        Label("Cloud Optical Isolation", systemImage: "icloud")
                        Spacer()
                        Text("Tokenized frame pass").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
                    }
                }
                .font(ElseType.bodyMD())
                .padding(16)
                .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
            }
            .padding(.top, 8)
        }
    }

    private func bias(_ text: String) -> some View {
        Text(text)
            .font(ElseType.bodyMD())
            .padding(.horizontal, 12)
            .frame(height: 36)
            .elseGlassCapsule()
    }

    private func control(_ icon: String, _ title: String, _ trailing: String?) -> some View {
        HStack {
            Label(title, systemImage: icon)
                .font(ElseType.bodyMD(.semibold))
            Spacer()
            if let trailing {
                Text(trailing).font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
            Image(systemName: "chevron.right").foregroundStyle(ElseTheme.labelTertiary)
        }
        .foregroundStyle(ElseTheme.onSurface)
        .padding(14)
        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
    }
}
