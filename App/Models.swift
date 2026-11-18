import Foundation

enum Category: String, CaseIterable, Identifiable {
    case countries = "Countries"
    case markets = "S&P 500"
    case ai = "AI"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .countries: return "globe.europe.africa.fill"
        case .markets: return "chart.line.uptrend.xyaxis"
        case .ai: return "sparkles"
        }
    }
}

struct Entity: Identifiable {
    let id: String
    let name: String
    let category: Category
    let summary: String
    let updatedAt: Date

    init(name: String, category: Category, summary: String, hoursAgo: Double) {
        self.id = name
        self.name = name
        self.category = category
        self.summary = summary
        self.updatedAt = Date().addingTimeInterval(-hoursAgo * 3600)
    }
}

enum SampleData {
    static let entities: [Entity] = [
        Entity(name: "United States", category: .countries,
               summary: "Lawmakers advanced a revised spending bill that changes how federal energy tax credits are phased out.", hoursAgo: 2),
        Entity(name: "Japan", category: .countries,
               summary: "The central bank kept its policy rate unchanged while signalling closer watch on the weakening yen.", hoursAgo: 5),
        Entity(name: "Germany", category: .countries,
               summary: "Industrial orders rose for the first time in four months, led by demand for machinery.", hoursAgo: 8),
        Entity(name: "Brazil", category: .countries,
               summary: "Officials announced new measures to speed up infrastructure permits ahead of the next budget cycle.", hoursAgo: 12),
        Entity(name: "India", category: .countries,
               summary: "Monsoon rainfall came in above forecast, easing concerns about this season's crop output.", hoursAgo: 16),
        Entity(name: "Canada", category: .countries,
               summary: "The government unveiled a plan to expand rail freight capacity between the prairies and the ports.", hoursAgo: 22),

        Entity(name: "Apple", category: .markets,
               summary: "Shares moved higher after the company reported stronger-than-expected services revenue.", hoursAgo: 3),
        Entity(name: "Microsoft", category: .markets,
               summary: "The company expanded its cloud data-centre build-out with new capacity in several regions.", hoursAgo: 6),
        Entity(name: "NVIDIA", category: .markets,
               summary: "Demand for its data-centre chips remained strong, keeping supply constraints in focus for investors.", hoursAgo: 9),
        Entity(name: "Amazon", category: .markets,
               summary: "The retailer reported higher advertising income while logistics costs continued to ease.", hoursAgo: 14),
        Entity(name: "Exxon Mobil", category: .markets,
               summary: "Output from its Permian operations rose, according to the latest quarterly production update.", hoursAgo: 19),
        Entity(name: "JPMorgan Chase", category: .markets,
               summary: "The bank raised its full-year net interest income outlook after a steady quarter in trading.", hoursAgo: 25),

        Entity(name: "OpenAI", category: .ai,
               summary: "Released an updated model with faster responses and improved coding and reasoning benchmarks.", hoursAgo: 1),
        Entity(name: "Anthropic", category: .ai,
               summary: "Launched new tools that let developers run longer, multi-step agent tasks with fewer checkpoints.", hoursAgo: 4),
        Entity(name: "Google DeepMind", category: .ai,
               summary: "Published research on a model that plans over longer horizons for robotics and scientific tasks.", hoursAgo: 7),
        Entity(name: "Meta AI", category: .ai,
               summary: "Opened a new open-weight model family aimed at on-device and low-cost deployments.", hoursAgo: 11),
        Entity(name: "Mistral AI", category: .ai,
               summary: "Announced a partnership to bring its models to enterprise platforms in Europe.", hoursAgo: 18)
    ]
}
