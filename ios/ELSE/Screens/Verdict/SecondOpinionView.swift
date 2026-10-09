import SwiftUI

/// Mirrors `second_opinion_comparison`
struct SecondOpinionView: View {
    var body: some View {
        ElseScrollScreen(title: "Second Opinion Hub") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                HStack {
                    optionCard("Option A", "Navy Wool", ElseTheme.primary)
                    optionCard("Option B", "Obsidian Silk", ElseTheme.secondary)
                }
                consensus
                arbiter
                independentTakes
                tieBreaker
            }
            .padding(.top, 8)
        }
    }

    private func optionCard(_ title: String, _ subtitle: String, _ tint: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(ElseType.labelCaps()).foregroundStyle(tint).textCase(.uppercase)
            Text(subtitle).font(ElseType.title())
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .elseGlassCard(cornerRadius: ElseTheme.radiusMd)
    }

    private var consensus: some View {
        HStack {
            Text("Consensus Split: 2 vs 1").font(ElseType.bodyLG(.semibold))
            Spacer()
            Text("3 Evaluators").font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .padding(14)
        .elseGlassCapsule()
    }

    private var arbiter: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Arbiter Synthesis", systemImage: "scalemass")
                .font(ElseType.title())
            Text("67% Agreement")
                .font(ElseType.headlineSM())
                .foregroundStyle(ElseTheme.primary)
            Text("They disagree on versatility.")
                .font(ElseType.bodyLG())
            Text("ELSE and Claude favor everyday wearability, while Gemini favors evening formality.")
                .font(ElseType.bodyMD())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .padding(18)
        .elseGlassCard()
    }

    private var independentTakes: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Independent Takes").font(ElseType.title())
                Spacer()
                Text("Simultaneous Run").font(ElseType.labelCaps()).foregroundStyle(ElseTheme.onSurfaceVariant).textCase(.uppercase)
            }
            take("E", "ELSE", "Lead Vision", "Navy", "“Pick the navy one.”")
            take("C", "Claude 3.7 Sonnet", "Analytical", "Navy", "“Pick the navy one.”")
            take("G", "Gemini 1.5 Pro", "Divergent", "Black", "“Pick the black one.”")
        }
    }

    private func take(_ glyph: String, _ name: String, _ role: String, _ pick: String, _ quote: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(glyph)
                .font(ElseType.title())
                .foregroundStyle(ElseTheme.onPrimary)
                .frame(width: 40, height: 40)
                .background(ElseTheme.primaryContainer, in: Circle())
            VStack(alignment: .leading, spacing: 4) {
                Text(name).font(ElseType.bodyLG(.semibold))
                Text(role).font(ElseType.caption()).foregroundStyle(ElseTheme.onSurfaceVariant)
                Text(pick).font(ElseType.caption(.semibold)).foregroundStyle(ElseTheme.primary)
                Text(quote).font(ElseType.bodyMD()).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
        }
        .padding(14)
        .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
    }

    private var tieBreaker: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Help me decide", systemImage: "wand.and.stars")
                .font(ElseType.title())
            Text("Tie-breaker Question")
                .font(ElseType.caption())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text("Where will this jacket be worn most in the next 30 days?")
                .font(ElseType.bodyLG(.semibold))
            Text("Day / Office / Travel")
                .font(ElseType.bodyMD())
                .foregroundStyle(ElseTheme.onSurfaceVariant)
        }
        .padding(18)
        .elseGlassCard()
    }
}
