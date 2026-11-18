import SwiftUI

struct ContentView: View {
    @State private var category: Category = .countries
    @State private var selected: Set<String> = Set(SampleData.entities.map { $0.id })

    private var visible: [Entity] {
        SampleData.entities.filter { $0.category == category }
    }

    private var shown: [Entity] {
        visible.filter { selected.contains($0.id) }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.backgroundGradient.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        categoryPicker
                        entityChips
                        highlights
                    }
                    .padding(20)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .sensoryFeedback(.selection, trigger: selected)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Pulse")
                .font(.system(size: 34, weight: .bold, design: .rounded))
            Text("One-line updates on what matters to you")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var categoryPicker: some View {
        Picker("Category", selection: $category) {
            ForEach(Category.allCases) { item in
                Text(item.rawValue).tag(item)
            }
        }
        .pickerStyle(.segmented)
    }

    private var entityChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(visible) { entity in
                    chip(for: entity)
                }
            }
        }
    }

    private func chip(for entity: Entity) -> some View {
        let isOn: Bool = selected.contains(entity.id)
        return Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                if isOn {
                    selected.remove(entity.id)
                } else {
                    selected.insert(entity.id)
                }
            }
        } label: {
            Text(entity.name)
                .font(.system(.subheadline, design: .rounded, weight: .semibold))
                .foregroundStyle(isOn ? Color.white : Theme.accent)
                .padding(.horizontal, 14)
                .frame(minHeight: 44)
                .background {
                    Capsule()
                        .fill(isOn ? Theme.accent : Theme.accent.opacity(0.12))
                }
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private var highlights: some View {
        if shown.isEmpty {
            emptyState
        } else {
            VStack(spacing: 14) {
                ForEach(shown) { entity in
                    HighlightCard(entity: entity)
                        .transition(.opacity.combined(with: .scale(scale: 0.95)))
                }
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: shown.map { $0.id })
        }
    }

    private var emptyState: some View {
        VStack(spacing: 14) {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .font(.system(size: 44))
                .foregroundStyle(Theme.accent)
            Text("No highlights selected")
                .font(.headline)
            Text("Pick one or more entities above to see their latest updates.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button("Select all") {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    selected.formUnion(visible.map { $0.id })
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(Theme.accent)
            .frame(minHeight: 44)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}
