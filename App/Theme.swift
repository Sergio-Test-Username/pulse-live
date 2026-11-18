import SwiftUI

enum Theme {
    static let top = Color(red: 0.42, green: 0.48, blue: 1.0)
    static let bottom = Color(red: 0.23, green: 0.18, blue: 0.88)
    static let accent = Color(red: 0.36, green: 0.42, blue: 1.0)
    static let cardRadius: CGFloat = 20

    static var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [top.opacity(0.14), Color(.systemBackground)],
            startPoint: .top,
            endPoint: .center
        )
    }

    static var heroGradient: LinearGradient {
        LinearGradient(
            colors: [top, bottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
