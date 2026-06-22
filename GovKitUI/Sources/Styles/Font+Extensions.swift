import SwiftUI
import UIKit

extension Font {
    public static var govUK: GOVUKFontBuilder {
        GOVUKFontBuilder()
    }
}

public struct GOVUKFontBuilder {
    public let largeTitle: Font = Font(GOVUKTransportFontProvider.font(style: .largeTitle, weight: .regular))
    public let largeTitleBold: Font = Font(GOVUKTransportFontProvider.font(style: .largeTitle, weight: .bold))

    public let title1: Font = Font(GOVUKTransportFontProvider.font(style: .title1, weight: .regular))
    public let title1Bold: Font = Font(GOVUKTransportFontProvider.font(style: .title1, weight: .bold))

    public let title2: Font = Font(GOVUKTransportFontProvider.font(style: .title2, weight: .regular))
    public let title2Bold: Font = Font(GOVUKTransportFontProvider.font(style: .title2, weight: .bold))

    public let title3: Font = Font(GOVUKTransportFontProvider.font(style: .title3, weight: .regular))
    public let title3Semibold: Font = Font(GOVUKTransportFontProvider.font(style: .title3, weight: .semibold))

    public let headlineSemibold: Font = Font(GOVUKTransportFontProvider.font(style: .headline, weight: .semibold))
    public let headlineSemiboldItalic: Font = Font(GOVUKTransportFontProvider.font(style: .headline, weight: .semibold, italic: true))

    public let body: Font = Font(GOVUKTransportFontProvider.font(style: .body, weight: .regular))
    public let bodyItalic: Font = Font(GOVUKTransportFontProvider.font(style: .body, weight: .regular, italic: true))
    public let bodySemibold: Font = Font(GOVUKTransportFontProvider.font(style: .body, weight: .semibold))
    public let bodySemiboldItalic: Font = Font(GOVUKTransportFontProvider.font(style: .body, weight: .semibold, italic: true))

    public let callout: Font = Font(GOVUKTransportFontProvider.font(style: .callout, weight: .regular))
    public let calloutItalic: Font = Font(GOVUKTransportFontProvider.font(style: .callout, weight: .regular, italic: true))
    public let calloutSemibold: Font = Font(GOVUKTransportFontProvider.font(style: .callout, weight: .semibold))
    public let calloutSemiboldItalic: Font = Font(GOVUKTransportFontProvider.font(style: .callout, weight: .semibold, italic: true))

    public let subheadline: Font = Font(GOVUKTransportFontProvider.font(style: .subheadline, weight: .regular))
    public let subheadlineItalic: Font = Font(GOVUKTransportFontProvider.font(style: .subheadline, weight: .regular, italic: true))
    public let subheadlineSemibold: Font = Font(GOVUKTransportFontProvider.font(style: .subheadline, weight: .semibold))
    public let subheadlineSemiboldItalic: Font = Font(GOVUKTransportFontProvider.font(style: .subheadline, weight: .semibold, italic: true))

    public let footnote: Font = Font(GOVUKTransportFontProvider.font(style: .footnote, weight: .regular))
    public let footnoteItalic: Font = Font(GOVUKTransportFontProvider.font(style: .footnote, weight: .regular, italic: true))
    public let footnoteSemibold: Font = Font(GOVUKTransportFontProvider.font(style: .footnote, weight: .semibold))
    public let footnoteSemiboldItalic: Font = Font(GOVUKTransportFontProvider.font(style: .footnote, weight: .semibold, italic: true))

    public let caption1: Font = Font(GOVUKTransportFontProvider.font(style: .caption1, weight: .regular))
    public let caption1Italic: Font = Font(GOVUKTransportFontProvider.font(style: .caption1, weight: .regular, italic: true))
    public let caption1Medium: Font = Font(GOVUKTransportFontProvider.font(style: .caption1, weight: .medium))
    public let caption1MediumItalic: Font = Font(GOVUKTransportFontProvider.font(style: .caption1, weight: .medium, italic: true))

    public let caption2: Font = Font(GOVUKTransportFontProvider.font(style: .caption2, weight: .regular))
    public let caption2Italic: Font = Font(GOVUKTransportFontProvider.font(style: .caption2, weight: .regular, italic: true))
    public let caption2Semibold: Font = Font(GOVUKTransportFontProvider.font(style: .caption2, weight: .semibold))
    public let caption2SemiboldItalic: Font = Font(GOVUKTransportFontProvider.font(style: .caption2, weight: .semibold, italic: true))
}
