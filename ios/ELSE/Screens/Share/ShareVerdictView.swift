import SwiftUI

/// Mirrors `shareable_verdict_card_else`
struct ShareVerdictView: View {
    @Environment(\.dismiss) private var dismiss
    let decision: ContextObject
    @State private var format = 0

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Picker("Format", selection: $format) {
                        Text("Story (9:16)").tag(0)
                        Text("Square (1:1)").tag(1)
                        Text("Text Only").tag(2)
                    }
                    .pickerStyle(.segmented)

                    verdictCard
                        .aspectRatio(format == 1 ? 1 : 9/16, contentMode: .fit)

                    Text("Tap to preview full resolution card")
                        .font(ElseType.caption())
                        .foregroundStyle(ElseTheme.onSurfaceVariant)

                    Text("Quick Share").font(ElseType.title()).frame(maxWidth: .infinity, alignment: .leading)
                    Text("Instant export to people & apps · AIRDROP READY")
                        .font(ElseType.labelCaps())
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    HStack(spacing: 16) {
                        sharePerson("AirDrop", "wifi")
                        sharePerson("Maya K.", "message.fill")
                        sharePerson("Julian R.", "person.crop.circle")
                        sharePerson("Sarah C.", "envelope.fill")
                    }

                    HStack {
                        SecondaryGlassButton(title: "Copy Image") {}
                        PrimaryPillButton(title: "Save Photo", systemImage: "camera") {}
                    }
                }
                .padding(ElseTheme.margin)
            }
            .background(ElseTheme.background.ignoresSafeArea())
            .navigationTitle("Share Verdict")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Share") {}
                }
            }
        }
    }

    private var verdictCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                OpticalApertureMark(size: 28)
                Text("ELSE").font(ElseType.title())
                Spacer()
                Text("SECOND OPINION")
                    .font(ElseType.labelCaps())
                    .tracking(1)
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
            }
            Text(decision.question)
                .font(ElseType.bodyLG())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text("AI PICK: NAVY")
                .font(ElseType.labelCaps())
                .foregroundStyle(ElseTheme.primary)
                .textCase(.uppercase)
            Text(decision.verdict)
                .font(ElseType.verdictXL())
            Text("“\(decision.reason)”")
                .font(ElseType.bodyMD())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
                .italic()
            Spacer()
            Text("ELSE · Your second opinion for real life.")
                .font(ElseType.caption())
                .foregroundStyle(ElseTheme.labelTertiary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .elseGlassCard(cornerRadius: ElseTheme.radiusXl)
    }

    private func sharePerson(_ name: String, _ icon: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .frame(width: 52, height: 52)
                .background(ElseTheme.surfaceContainerHigh, in: Circle())
            Text(name).font(ElseType.caption())
        }
        .foregroundStyle(ElseTheme.onSurface)
        .frame(maxWidth: .infinity)
    }
}
