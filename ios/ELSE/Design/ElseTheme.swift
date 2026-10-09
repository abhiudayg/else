import SwiftUI

enum ElseTheme {
    static let background = Color(hex: 0x131313)
    static let canvas = Color.black
    static let surface = Color(hex: 0x131313)
    static let surfaceDim = Color(hex: 0x131313)
    static let surfaceBright = Color(hex: 0x393939)
    static let surfaceContainerLowest = Color(hex: 0x0E0E0E)
    static let surfaceContainerLow = Color(hex: 0x1B1B1B)
    static let surfaceContainer = Color(hex: 0x1F1F1F)
    static let surfaceContainerHigh = Color(hex: 0x2A2A2A)
    static let surfaceContainerHighest = Color(hex: 0x353535)
    static let onSurface = Color(hex: 0xE2E2E2)
    static let onSurfaceVariant = Color(hex: 0xC1C6D7)
    static let outline = Color(hex: 0x8B90A0)
    static let outlineVariant = Color(hex: 0x414755)

    static let primary = Color(hex: 0xADC6FF)
    static let onPrimary = Color(hex: 0x002E69)
    static let primaryContainer = Color(hex: 0x4B8EFF)
    static let onPrimaryContainer = Color(hex: 0x00285C)
    static let secondary = Color(hex: 0xB4C5FF)
    static let secondaryContainer = Color(hex: 0x0053DB)
    static let tertiary = Color(hex: 0xFFB595)
    static let error = Color(hex: 0xFFB4AB)
    static let systemBlue = Color(hex: 0x007AFF)
    static let indigo = Color(hex: 0x5856D6)
    static let statusGreen = Color(hex: 0x34C759)
    static let statusAmber = Color(hex: 0xFF9F0A)

    static let labelPrimary = Color.white
    static let labelSecondary = Color.white.opacity(0.60)
    static let labelTertiary = Color.white.opacity(0.30)

    static let glassUltraThin = Color.white.opacity(0.04)
    static let glassThin = Color.white.opacity(0.08)
    static let glassRegular = Color.white.opacity(0.12)
    static let glassThick = Color.white.opacity(0.18)
    static let glassPanel = Color(red: 20/255, green: 20/255, blue: 24/255).opacity(0.65)

    static let radiusSm: CGFloat = 8
    static let radiusDefault: CGFloat = 16
    static let radiusMd: CGFloat = 24
    static let radiusLg: CGFloat = 32
    static let radiusXl: CGFloat = 48

    static let spaceXs: CGFloat = 4
    static let spaceSm: CGFloat = 8
    static let spaceMd: CGFloat = 16
    static let spaceLg: CGFloat = 24
    static let spaceXl: CGFloat = 32
    static let margin: CGFloat = 16
}

extension Color {
    init(hex: UInt32, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

enum ElseType {
    static func verdictXL(_ weight: Font.Weight = .bold, scale: CGFloat = 1) -> Font {
        .system(size: 40 * scale, weight: weight, design: .default)
    }
    static func headlineLG(_ weight: Font.Weight = .bold, scale: CGFloat = 1) -> Font {
        .system(size: 34 * scale, weight: weight)
    }
    static func headlineMD(_ weight: Font.Weight = .semibold, scale: CGFloat = 1) -> Font {
        .system(size: 28 * scale, weight: weight)
    }
    static func headlineSM(_ weight: Font.Weight = .semibold, scale: CGFloat = 1) -> Font {
        .system(size: 22 * scale, weight: weight)
    }
    static func title(_ weight: Font.Weight = .semibold, scale: CGFloat = 1) -> Font {
        .system(size: 20 * scale, weight: weight)
    }
    static func bodyLG(_ weight: Font.Weight = .regular, scale: CGFloat = 1) -> Font {
        .system(size: 17 * scale, weight: weight)
    }
    static func bodyMD(_ weight: Font.Weight = .regular, scale: CGFloat = 1) -> Font {
        .system(size: 15 * scale, weight: weight)
    }
    static func caption(_ weight: Font.Weight = .regular, scale: CGFloat = 1) -> Font {
        .system(size: 13 * scale, weight: weight)
    }
    static func labelCaps(_ weight: Font.Weight = .semibold, scale: CGFloat = 1) -> Font {
        .system(size: 11 * scale, weight: weight)
    }
}
