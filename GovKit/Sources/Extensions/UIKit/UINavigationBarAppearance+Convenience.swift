import Foundation
import UIKit

import GovKitUI

extension UINavigationBarAppearance {
    public static var govUK: UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.govUK.fills.surfaceHomeHeaderBackground
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.govUK.text.header,
            .font: UIFont.govUK.bodySemibold
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.govUK.text.header,
            .font: UIFont.govUK.largeTitleBold
        ]
        return appearance
    }
}
