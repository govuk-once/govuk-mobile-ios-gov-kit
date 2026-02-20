import Foundation
import UIKit
import Testing

@testable import GovKitUI

@Suite
@MainActor
struct GOVUKColors_StrokesTests {
    @Test
    func listDivider_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.listDivider

        #expect(result.lightMode == .blueTint80)
        #expect(result.darkMode == .blueDarkMode)
    }

    @Test
    func buttonPrimaryFocused_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonPrimaryFocused

        #expect(result.lightMode == .black)
        #expect(result.darkMode == .yellowShade50)
    }

    @Test
    func pageControlInactive_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.pageControlInactive

        #expect(result.lightMode == .grey500)
        #expect(result.darkMode == .grey300)
    }

    @Test
    func cardBlue_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.cardBlue

        #expect(result.lightMode == .blueTint50)
        #expect(result.darkMode == .primaryBlue)
    }

    @Test
    func cardGreen_light_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.cardGreen

        #expect(result.lightMode == .greenTint50)
    }

    @Test
    func cardGreen_dark_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.cardGreen

        #expect(result.darkMode == .greenTint25)
    }

    @Test
    func cardDefault_light_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.cardDefault

        #expect(result.lightMode == .blueTint80)
    }

    @Test
    func cardDefault_dark_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.cardDefault

        #expect(result.darkMode == .blueDarkMode)
    }

    @Test
    func error_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.error
        
        #expect(result.lightMode == .primaryRed)
        #expect(result.darkMode == .accentRed)
    }

    @Test
    func cardSelected_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.cardSelected

        #expect(result.lightMode == .primaryGreen)
        #expect(result.darkMode == .accentGreen)
    }

    @Test
    func buttonCompactHighlight_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonCompactHighlight

        #expect(result.lightMode == .blueTint25)
        #expect(result.darkMode == .blueShade25)
    }

    @Test
    func buttonPrimaryDefault_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonPrimaryDefault

        #expect(result.lightMode == .greenShade50)
        #expect(result.darkMode == .primaryGreen)
    }

    @Test
    func buttonPrimaryHighlight_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonPrimaryHighlight

        #expect(result.lightMode == .greenShade80)
        #expect(result.darkMode == .greenShade50)
    }

    @Test
    func buttonFocused_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonFocused

        #expect(result.lightMode == .black)
        #expect(result.darkMode == .yellowShade50)
    }

    @Test
    func buttonDestructiveDefault_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonDestructiveDefault

        #expect(result.lightMode == .redShade50)
        #expect(result.darkMode == .primaryRed)
    }

    @Test
    func buttonDestructiveHighlight_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.buttonDestructiveHighlight

        #expect(result.lightMode == .redShade80)
        #expect(result.darkMode == .redShade50)
    }

    @Test
    func fixedContainer_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.fixedContainer

        #expect(result.lightMode == .black.withAlphaComponent(0.3))
        #expect(result.darkMode == .white.withAlphaComponent(0.3))
    }

    @Test
    func surfaceCardEmergencyNotableDeath_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.surfaceCardEmergencyNotableDeath

        #expect(result.lightMode == .clear)
        #expect(result.darkMode == .white)
    }

    @Test
    func surfaceCardEmergencyInfo_returnsExpectedResult() {
        let result = UIColor.govUK.strokes.surfaceCardEmergencyInfo

        #expect(result.lightMode == .blueTint25)
        #expect(result.darkMode == .blueTint25)
    }
}
