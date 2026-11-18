import SwiftUI

struct HighlightCard: View {
    let entity: Entity

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: entity.category.symbol)
                .font(.title3.weight(.semibold))
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(Theme.heroGradient, in: Circle())

            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .firstTextBaseline) {
                    Text(entity.name)
                        .font(.system(.headline, design: .rounded))
                    Spacer(minLength: 8)
                    Text(entity.updatedAt, style: .relative)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text(entity.summary)
                    .font(.subheadline)
                    .foregroundStyle(.primary.opacity(0.85))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(16)
        .background(
            Color(.secondarySystemBackground),
            in: RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
        )
        .shadow(color: Theme.accent.opacity(0.12), radius: 12, y: 6)
    }
}
