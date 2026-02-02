import UIKit

extension NSTextAlignment {
    var titleAlignment: UIButton.Configuration.TitleAlignment {
        switch self {
        case .left:
                .leading
        case .right:
                .trailing
        default:
                .center
        }
    }
}
