import UIKit

extension UIFont {
    public static var govUK: GOVUKUIFontBuilder {
        GOVUKUIFontBuilder()
    }
}

extension UIFont {
    public convenience init(style: TextStyle,
                            weight: Weight = .regular,
                            design: UIFontDescriptor.SystemDesign = .default) {
        guard let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
            .addingAttributes(
                [
                    .traits: [
                        UIFontDescriptor.TraitKey.weight: weight
                    ]
                ]
            )
                .withDesign(design) else {
            preconditionFailure("Could not find a matching font")
        }


        self.init(descriptor: descriptor, size: 0)
    }

    func italic() -> UIFont {
        if let descriptor = self.fontDescriptor.withSymbolicTraits(.traitItalic) {
            return UIFont(descriptor: descriptor, size: 0)
        }
        return self
    }
}

public struct GOVUKUIFontBuilder {
    public let largeTitle = GOVUKTransportFontProvider.font(style: .largeTitle, weight: .regular)
    public let largeTitleBold = GOVUKTransportFontProvider.font(style: .largeTitle, weight: .bold)

    public let title1 = GOVUKTransportFontProvider.font(style: .title1, weight: .regular)
    public let title1Bold = GOVUKTransportFontProvider.font(style: .title1, weight: .bold)

    public let title2 = GOVUKTransportFontProvider.font(style: .title2, weight: .regular)
    public let title2Bold = GOVUKTransportFontProvider.font(style: .title2, weight: .bold)

    public let title3 = GOVUKTransportFontProvider.font(style: .title3, weight: .regular)
    public let title3Semibold = GOVUKTransportFontProvider.font(style: .title3, weight: .semibold)

    public let headlineSemibold = GOVUKTransportFontProvider.font(style: .headline, weight: .semibold)

    public let body = GOVUKTransportFontProvider.font(style: .body, weight: .regular)
    public var bodyItalic: UIFont { GOVUKTransportFontProvider.font(style: .body, weight: .regular, italic: true) }
    public let bodySemibold = GOVUKTransportFontProvider.font(style: .body, weight: .semibold)

    public let callout = GOVUKTransportFontProvider.font(style: .callout, weight: .regular)
    public var calloutItalic: UIFont { GOVUKTransportFontProvider.font(style: .callout, weight: .regular, italic: true) }
    public let calloutSemibold = GOVUKTransportFontProvider.font(style: .callout, weight: .semibold)

    public let subheadline = GOVUKTransportFontProvider.font(style: .subheadline, weight: .regular)
    public var subheadlineItalic: UIFont { GOVUKTransportFontProvider.font(style: .subheadline, weight: .regular, italic: true) }
    public let subheadlineSemibold = GOVUKTransportFontProvider.font(style: .subheadline, weight: .semibold)

    public let footnote = GOVUKTransportFontProvider.font(style: .footnote, weight: .regular)
    public var footnoteItalic: UIFont { GOVUKTransportFontProvider.font(style: .footnote, weight: .regular, italic: true) }
    public let footnoteSemibold = GOVUKTransportFontProvider.font(style: .footnote, weight: .semibold)

    public let caption1 = GOVUKTransportFontProvider.font(style: .caption1, weight: .regular)
    public var caption1Italic: UIFont { GOVUKTransportFontProvider.font(style: .caption1, weight: .regular, italic: true) }
    public let caption1Medium = GOVUKTransportFontProvider.font(style: .caption1, weight: .medium)

    public let caption2 = GOVUKTransportFontProvider.font(style: .caption2, weight: .regular)
    public var caption2Italic: UIFont { GOVUKTransportFontProvider.font(style: .caption2, weight: .regular, italic: true) }
    public let caption2Semibold = GOVUKTransportFontProvider.font(style: .caption2, weight: .semibold)
}
