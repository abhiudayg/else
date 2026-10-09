import SwiftUI

/// Pixel-tuned to `designs/your_else_history`
struct HistoryView: View {
    @Environment(AppRouter.self) private var router
    let items: [ContextObject]

    var body: some View {
        ElseScrollScreen(title: "Profile Vault") { metrics in
            VStack(alignment: .leading, spacing: metrics.sectionGap) {
                Text("Your decisions, captured over time.")
                    .font(ElseType.bodyLG(scale: metrics.typeScale))
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                    .frame(maxWidth: .infinity, alignment: .leading)

                noticedStrip(metrics)

                daySection("Today", "1 Decision", items.filter { Calendar.current.isDateInToday($0.createdAt) }, metrics)
                daySection("Yesterday", "Shopping", items.filter { Calendar.current.isDateInYesterday($0.createdAt) }, metrics)
                daySection("Earlier", "Documents", items.filter {
                    !Calendar.current.isDateInToday($0.createdAt) && !Calendar.current.isDateInYesterday($0.createdAt)
                }, metrics)

                VStack(spacing: 6) {
                    Text("\(items.count) total verdicts in memory vault")
                        .font(ElseType.caption(scale: metrics.typeScale))
                        .foregroundStyle(ElseTheme.onSurfaceVariant)
                    Text("All captured snapshots remain private on this device")
                        .font(ElseType.labelCaps(scale: metrics.typeScale))
                        .foregroundStyle(ElseTheme.labelTertiary)
                        .textCase(.uppercase)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 8)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { router.push(.emptyHistory) } label: { Image(systemName: "trash") }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button { router.push(.privacyMemory) } label: { Image(systemName: "person.crop.circle") }
            }
        }
        .searchable(text: .constant(""), prompt: "Search your decisions")
    }

    private func noticedStrip(_ metrics: ElseLayoutMetrics) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Pattern Recognized")
                .font(ElseType.labelCaps(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.primary)
                .textCase(.uppercase)
            Text("ELSE noticed:")
                .font(ElseType.caption(scale: metrics.typeScale))
                .foregroundStyle(ElseTheme.onSurfaceVariant)
            Text("You tend to choose neutral colours.")
                .font(ElseType.bodyLG(.semibold, scale: metrics.typeScale))
                .fixedSize(horizontal: false, vertical: true)
            HStack(spacing: 10) {
                Button("Correct") {}
                    .font(ElseType.caption(.semibold, scale: metrics.typeScale))
                    .foregroundStyle(ElseTheme.onPrimary)
                    .padding(.horizontal, 14)
                    .frame(height: 32)
                    .background(ElseTheme.primaryContainer, in: Capsule())
                Button("Dismiss") {}
                    .font(ElseType.caption(.semibold, scale: metrics.typeScale))
                    .foregroundStyle(ElseTheme.onSurfaceVariant)
                Spacer(minLength: 0)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .elseGlassCard()
    }

    private func daySection(_ title: String, _ meta: String, _ rows: [ContextObject], _ metrics: ElseLayoutMetrics) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title).font(ElseType.title(scale: metrics.typeScale))
                Spacer()
                Text(meta).font(ElseType.caption(scale: metrics.typeScale)).foregroundStyle(ElseTheme.onSurfaceVariant)
            }
            ForEach(rows) { item in
                Button { router.push(.historyDetail) } label: {
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(ElseTheme.surfaceContainerHigh)
                            .frame(width: 64, height: 64)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(item.topic) • \(item.createdAt.formatted(date: .omitted, time: .shortened))")
                                .font(ElseType.labelCaps(scale: metrics.typeScale))
                                .foregroundStyle(ElseTheme.onSurfaceVariant)
                                .textCase(.uppercase)
                            Text(item.question)
                                .font(ElseType.bodyLG(.semibold, scale: metrics.typeScale))
                                .foregroundStyle(ElseTheme.onSurface)
                                .lineLimit(2)
                                .minimumScaleFactor(0.9)
                            Text(item.verdict)
                                .font(ElseType.bodyMD(scale: metrics.typeScale))
                                .foregroundStyle(ElseTheme.onSurfaceVariant)
                                .lineLimit(2)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right").foregroundStyle(ElseTheme.labelTertiary)
                    }
                    .padding(14)
                    .elseGlassCard(cornerRadius: ElseTheme.radiusDefault)
                }
                .buttonStyle(.plain)
            }
        }
    }
}
