import Foundation
import UIKit

import UIComponents

extension UINavigationBar {
    public func setGovUKAppearance() {
        standardAppearance = .govUK
        scrollEdgeAppearance = .govUK
        compactAppearance = .govUK
        tintColor = UIColor.govUK.text.linkHeader
    }
}
