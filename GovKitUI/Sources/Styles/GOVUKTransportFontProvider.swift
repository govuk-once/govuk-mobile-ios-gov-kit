import UIKit
import CoreText

enum GOVUKTransportFontProvider {
    private static let lightFontResourceName = "transport_light"
    private static let boldFontResourceName = "transport_bold"

    private static let registerFontsOnce: Void = {
        transportLightPostScriptName = registerFont(named: lightFontResourceName)
        transportBoldPostScriptName = registerFont(named: boldFontResourceName)
        #if DEBUG
        if transportLightPostScriptName == nil || transportBoldPostScriptName == nil {
            debugPrint(
                "GovKitUI: Transport font registration incomplete.",
                "light=\(String(describing: transportLightPostScriptName))",
                "bold=\(String(describing: transportBoldPostScriptName))"
            )
        }
        #endif
    }()

    private static var transportLightPostScriptName: String?
    private static var transportBoldPostScriptName: String?

    static func font(
        style: UIFont.TextStyle,
        weight: UIFont.Weight,
        italic: Bool = false
    ) -> UIFont {
        registerFontsIfNeeded()

        let baseSize = UIFont.preferredFont(forTextStyle: style).pointSize
        let effectiveWeight = accessibilityAdjustedWeight(for: weight)
        let mappedWeight = mappedTransportWeight(for: effectiveWeight)

        if let transportFont = transportFont(for: mappedWeight, pointSize: baseSize) {
            let scaled = UIFontMetrics(forTextStyle: style).scaledFont(for: transportFont)
            return italic ? scaled.italic() : scaled
        }

        let fallback = UIFont(style: style, weight: effectiveWeight)
        return italic ? fallback.italic() : fallback
    }

    private static func registerFontsIfNeeded() {
        _ = registerFontsOnce
    }

    private static func transportFont(
        for weight: UIFont.Weight,
        pointSize: CGFloat
    ) -> UIFont? {
        let postScriptName = (weight == .semibold || weight == .bold)
            ? transportBoldPostScriptName
            : transportLightPostScriptName

        guard let postScriptName else { return nil }
        return UIFont(name: postScriptName, size: pointSize)
    }

    private static func mappedTransportWeight(for weight: UIFont.Weight) -> UIFont.Weight {
        if weight >= .semibold {
            return .bold
        }
        return .regular
    }

    private static func accessibilityAdjustedWeight(for weight: UIFont.Weight) -> UIFont.Weight {
        guard UIAccessibility.isBoldTextEnabled else { return weight }
        if weight < .semibold {
            return .semibold
        }
        return weight
    }

    private static func registerFont(named resourceName: String) -> String? {
        guard let url = fontResourceURL(named: resourceName) else {
            #if DEBUG
            debugPrint("GovKitUI: Missing font resource \(resourceName).ttf in Bundle.module")
            #endif
            return nil
        }

        guard
            let provider = CGDataProvider(url: url as CFURL),
            let font = CGFont(provider),
            let postScriptName = font.postScriptName as String?
        else {
            #if DEBUG
            debugPrint("GovKitUI: Unable to create CGFont for \(resourceName).ttf")
            #endif
            return nil
        }

        var registrationError: Unmanaged<CFError>?
        let didRegister = CTFontManagerRegisterGraphicsFont(font, &registrationError)
        if !didRegister, let error = registrationError?.takeRetainedValue() {
            let errorCode = CFErrorGetCode(error)
            let alreadyRegistered = errorCode == CTFontManagerError.alreadyRegistered.rawValue
            if !alreadyRegistered {
                #if DEBUG
                debugPrint("GovKitUI: Font registration failed for \(resourceName).ttf: \(error)")
                #endif
                return nil
            }
        }

        return postScriptName
    }

    private static func fontResourceURL(named resourceName: String) -> URL? {
        Bundle.module.url(
            forResource: resourceName,
            withExtension: "ttf",
            subdirectory: "Fonts"
        ) ?? Bundle.module.url(
            forResource: resourceName,
            withExtension: "ttf"
        )
    }
}
