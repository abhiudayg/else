import SwiftUI

/// Mirrors `offline_else`
struct OfflineView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 18) {
            HStack {
                Text("Local Matrix").font(ElseType.caption(.semibold))
                Spacer()
                Label("Offline", systemImage: "icloud.slash")
                    .font(ElseType.labelCaps())
                    .foregroundStyle(ElseTheme.statusAmber)
                    .textCase(.uppercase)
            }
            .padding(.horizontal)

            Spacer()
            Image(systemName: "antenna.radiowaves.left.and.right.slash")
                .font(.system(size: 48))
                .foregroundStyle(ElseTheme.primary)
            Text("You're offline.")
                .font(ElseType.headlineMD())
            Text("ELSE can still answer using on-device intelligence powered by Apple Neural Engine.")
                .font(ElseType.bodyLG())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            VStack(alignment: .leading, spacing: 12) {
                Text("Subsystem Readiness").font(ElseType.title())
                status("Optical Decision Engine", "Visual synthesis & spatial scans", "On-Device", true)
                status("Vault History & Memories", "Private local embedding index", "Local", true)
                status("Second Opinion Multi-Model", "Distributed cloud consensus", "Requires Network", false)
            }
            .padding(16)
            .elseGlassCard()
            .padding(.horizontal, ElseTheme.margin)

            HStack {
                Text("Latency Advantage")
                Spacer()
                Text("< 18ms").font(ElseType.headlineSM()).foregroundStyle(ElseTheme.primary)
            }
            .font(ElseType.bodyMD())
            .padding(.horizontal, ElseTheme.margin)

            PrimaryPillButton(title: "Try On-Device", systemImage: "play.fill") { dismiss() }
                .padding(.horizontal, ElseTheme.margin)
            Button("Dismiss") { dismiss() }
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text("Neural Engine 16-Core • Ready Offline")
                .font(ElseType.labelCaps())
                .foregroundStyle(ElseTheme.labelTertiary)
                .textCase(.uppercase)
            Spacer()
        }
        .background(ElseTheme.background.ignoresSafeArea())
    }

    private func status(_ title: String, _ sub: String, _ badge: String, _ ok: Bool) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(ElseType.bodyMD(.semibold))
                Text(sub).font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
            Spacer()
            Text(badge)
                .font(ElseType.labelCaps())
                .foregroundStyle(ok ? ElseTheme.statusGreen : ElseTheme.statusAmber)
                .textCase(.uppercase)
        }
    }
}
