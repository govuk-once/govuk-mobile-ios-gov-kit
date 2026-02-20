import Foundation
import UIKit

extension GOVUKColors {
    public struct Strokes {
        public static let listDivider: UIColor = {
            .init(
                light: .blueTint80,
                dark: .blueDarkMode
            )
        }()

        public static let pageControlInactive: UIColor = {
            .init(
                light: .grey500,
                dark: .grey300
            )
        }()

        public static let buttonPrimaryFocused: UIColor = {
            .init(
                light: .black,
                dark: .yellowShade50
            )
        }()

        public static let buttonDestructiveDefault: UIColor = {
            .init(
                light: .redShade50,
                dark: .primaryRed
            )
        }()

        public static let buttonFocused: UIColor = {
            .init(
                light: .black,
                dark: .yellowShade50
            )
        }()

        public static let buttonDestructiveHighlight: UIColor = {
            .init(
                light: .redShade80,
                dark: .redShade50
            )
        }()

        public static let buttonPrimaryDefault: UIColor = {
            .init(
                light: .greenShade50,
                dark: .primaryGreen
            )
        }()

        public static let buttonPrimaryHighlight: UIColor = {
            .init(
                light: .greenShade80,
                dark: .greenShade50
            )
        }()

        public static let cardBlue: UIColor = {
            .init(
                light: .blueTint50,
                dark: .primaryBlue
            )
        }()

        public static let cardDefault: UIColor = {
            .init(light: .blueTint80,
                  dark: .blueDarkMode
            )
        }()

        public static let cardGreen: UIColor = {
            .init(
                light: .greenTint50,
                dark: .greenTint25
            )
        }()

        public static let error: UIColor = {
            .init(
                light: .primaryRed,
                dark: .accentRed
            )
        }()

        public static let cardSelected: UIColor = {
            .init(
                light: .primaryGreen,
                dark: .accentGreen
            )
        }()

        public static let buttonCompactHighlight: UIColor = {
            .init(
                light: .blueTint25,
                dark: .blueShade25
            )
        }()

        public static let fixedContainer: UIColor = {
            .init(
                light: .black.withAlphaComponent(0.3),
                dark: .white.withAlphaComponent(0.3)
            )
        }()

        public static let surfaceCardEmergencyNotableDeath: UIColor = {
            .init(
                light: .clear,
                dark: .white
            )
        }()

        public static let surfaceCardEmergencyInfo: UIColor = {
            .init(
                light: .blueTint25,
                dark: .blueTint25
            )
        }()
    }
}
