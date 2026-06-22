import Foundation
import UIKit
import Testing

@testable import GovKitUI

@Suite
@MainActor
struct UIFontExtensionsTests {
    private let transportFamilyName = "GDS Transport Website"

    // MARK: LARGE TITLE
    @Test
    func largeTitle_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.largeTitle
        assertTransportFont(font)
        assertFontSize(font: font, size: 34)
    }

    @Test
    func largeTitleBold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.largeTitleBold
        assertTransportFont(font)
        assertFontSize(font: font, size: 34)
    }

    // MARK: TITLE 1
    @Test
    func title1_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.title1
        assertTransportFont(font)
        assertFontSize(font: font, size: 28)
    }

    @Test
    func title1Bold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.title1Bold
        assertTransportFont(font)
        assertFontSize(font: font, size: 28)
    }

    // MARK: TITLE 2
    @Test
    func title2_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.title2
        assertTransportFont(font)
        assertFontSize(font: font, size: 22)
    }

    @Test
    func title2Bold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.title2Bold
        assertTransportFont(font)
        assertFontSize(font: font, size: 22)
    }

    // MARK: TITLE 3
    @Test
    func title3_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.title3
        assertTransportFont(font)
        assertFontSize(font: font, size: 20)
    }

    @Test
    func title3Semibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.title3Semibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 20)
    }

    // MARK: HEADLINE
    @Test
    func headlineSemibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.headlineSemibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 17)
    }

    // MARK: BODY
    @Test
    func body_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.body
        assertTransportFont(font)
        assertFontSize(font: font, size: 17)
    }

    @Test
    func bodySemibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.bodySemibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 17)
    }

    @Test
    func bodyItalic_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.bodyItalic
        assertTransportFont(font)
        assertFontSize(font: font, size: 17)
    }

    // MARK: CALLOUT
    @Test
    func callout_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.callout
        assertTransportFont(font)
        assertFontSize(font: font, size: 16)
    }

    @Test
    func calloutSemibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.calloutSemibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 16)
    }

    @Test
    func calloutItalic_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.calloutItalic
        assertTransportFont(font)
        assertFontSize(font: font, size: 16)
    }

    // MARK: SUBHEADLINE
    @Test
    func subheadline_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.subheadline
        assertTransportFont(font)
        assertFontSize(font: font, size: 15)
    }

    @Test
    func subheadlineSemibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.subheadlineSemibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 15)
    }

    @Test
    func subheadlineItalic_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.subheadlineItalic
        assertTransportFont(font)
        assertFontSize(font: font, size: 15)
    }

    // MARK: FOOTNOTE
    @Test
    func footnote_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.footnote
        assertTransportFont(font)
        assertFontSize(font: font, size: 13)
    }

    @Test
    func footnoteSemibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.footnoteSemibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 13)
    }

    @Test
    func footnoteItalic_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.footnoteItalic
        assertTransportFont(font)
        assertFontSize(font: font, size: 13)
    }

    // MARK: CAPTION 1
    @Test
    func caption1_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.caption1
        assertTransportFont(font)
        assertFontSize(font: font, size: 12)
    }

    @Test
    func caption1Medium_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.caption1Medium
        assertTransportFont(font)
        assertFontSize(font: font, size: 12)
    }

    @Test
    func caption1Italic_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.caption1Italic
        assertTransportFont(font)
        assertFontSize(font: font, size: 12)
    }

    // MARK: CAPTION 2
    @Test
    func caption2_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.caption2
        assertTransportFont(font)
        assertFontSize(font: font, size: 11)
    }

    @Test
    func caption2Semibold_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.caption2Semibold
        assertTransportFont(font)
        assertFontSize(font: font, size: 11)
    }

    @Test
    func caption2Italic_hasCorrectSizeAndFont() {
        let font = UIFont.govUK.caption2Italic
        assertTransportFont(font)
        assertFontSize(font: font, size: 11)
    }

    // MARK: - Helpers

    private func assertTransportFont(
        _ font: UIFont,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            font.familyName == transportFamilyName,
            "Expected Transport font but got \(font.familyName) (\(font.fontName))",
            sourceLocation: sourceLocation
        )
    }

    private func assertFontSize(
        font: UIFont,
        size: CGFloat,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        let contentSize = UIScreen.main.traitCollection.preferredContentSizeCategory
        if contentSize == .large {
            #expect(font.pointSize == size, sourceLocation: sourceLocation)
        } else {
            print("\(contentSize.rawValue) is wrong dynamic type scale for font unit tests. Should use the default (large)")
        }
    }
}
