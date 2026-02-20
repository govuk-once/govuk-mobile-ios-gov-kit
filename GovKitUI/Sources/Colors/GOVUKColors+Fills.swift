import Foundation
import UIKit

extension GOVUKColors {
    public struct Fills {
        public static let surfaceFixedContainer: UIColor = {
            .init(
                light: .white.withAlphaComponent(0.75),
                dark: .blueShade80.withAlphaComponent(0.75)
            )
        }()

        public static let surfaceBackground: UIColor = {
            .init(
                light: .blueTint90,
                dark: .blueShade80
            )
        }()

        public static let surfaceFullscreen: UIColor = {
            .init(
                light: .white,
                dark: .blueShade80
            )
        }()

        public static let surfaceCardDefault: UIColor = {
            .init(
                light: .white,
                dark: .blueShade65
            )
        }()

        public static let surfaceCardBlue: UIColor = {
            .init(
                light: .blueTint95,
                dark: .blueShade50
            )
        }()

        public static let surfaceCardSelected: UIColor = {
            .init(
                light: .greenTint95,
                dark: .greenShade50
            )
        }()

        public static let surfaceCardNonTappable: UIColor = {
            .init(
                light: .blueTint80,
                dark: .blueShade75
            )
        }()

        public static let surfaceButtonPrimary: UIColor = {
            .init(
                light: .primaryGreen,
                dark: .accentGreen
            )
        }()

        public static let surfaceButtonPrimaryHighlight: UIColor = {
            .init(
                light: .greenShade25,
                dark: .greenTint25
            )
        }()

        public static let surfaceButtonPrimaryFocussed: UIColor = {
            .primaryYellow
        }()

        public static let surfaceButtonPrimaryDisabled: UIColor = {
            .init(
                light: .grey100,
                dark: .grey400
            )
        }()

        public static let surfaceButtonSecondary: UIColor = {
            .clear
        }()

        public static let surfaceButtonSecondaryHighlight: UIColor = {
            .clear
        }()

        public static let surfaceButtonSecondaryFocussed: UIColor = {
            .primaryYellow
        }()

        public static let surfaceButtonCompact: UIColor = {
            .init(
                light: .blueTint95,
                dark: .blueShade80
            )
        }()

        public static let surfaceButtonCompactHighlight: UIColor = {
            .init(
                light: .blueTint95,
                dark: .blueShade80
            )
        }()

        public static let surfaceButtonCompactFocussed: UIColor = {
            .primaryYellow
        }()

        public static let surfaceButtonCompactDisabled: UIColor = {
            .init(
                light: .grey100,
                dark: .grey400
            )
        }()

        public static let surfaceButtonDestructive: UIColor = {
            .init(
                light: .primaryRed,
                dark: .accentRed
            )
        }()

        public static let surfaceButtonDestructiveHighlight: UIColor = {
            .init(
                light: .redShade25,
                dark: .primaryRed
            )
        }()

        public static let surfaceModal: UIColor = {
            .init(
                light: .white,
                dark: .blueShade80
            )
        }()

        public static let surfaceSearch: UIColor = {
            .init(
                light: .white,
                dark: .blueDarkMode
            )
        }()

        public static let surfaceHomeHeaderBackground: UIColor = {
            .init(
                light: .primaryBlue,
                dark: .blueShade65
            )
        }()

        public static let surfaceToggleSelected: UIColor = {
            .init(
                light: .primaryGreen,
                dark: .primaryGreen
            )
        }()

        public static let surfaceList: UIColor = {
            .init(
                light: .white,
                dark: .blueShade70
            )
        }()

        public static let surfaceListHeading: UIColor = {
            .init(
                light: .blueTint95,
                dark: .blueShade50
            )
        }()

        public static let surfaceListSelected: UIColor = {
            .init(
                light: .primaryBlue,
                dark: .blueShade25
            )
        }()

        public static let surfaceListUnselected: UIColor = {
            .init(
                light: .blueTint90,
                dark: .blueShade75
            )
        }()

        public static let surfaceCardEmergencyNotableDeath: UIColor = {
            .init(
                light: .black,
                dark: .black
            )
        }()

        public static let surfaceCardEmergencyNational: UIColor = {
            .init(
                light: .primaryRed,
                dark: .primaryRed
            )
        }()

        public static let surfaceCardEmergencyLocal: UIColor = {
            .init(
                light: .primaryTeal,
                dark: .primaryTeal
            )
        }()

        public static let surfaceCardEmergencyInfo: UIColor = {
            .init(
                light: .white,
                dark: .blueDarkMode
            )
        }()
    }
}
