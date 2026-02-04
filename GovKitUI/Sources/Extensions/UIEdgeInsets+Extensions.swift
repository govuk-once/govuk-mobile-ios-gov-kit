import UIKit

extension UIEdgeInsets {
    var horizontal: CGFloat {
        left + right
    }

    var vertical: CGFloat {
        top + bottom
    }

    var directionalInsets: NSDirectionalEdgeInsets {
        .init(
            top: self.top,
            leading: self.left,
            bottom: self.bottom,
            trailing: self.right
        )
    }
}

extension NSDirectionalEdgeInsets {
    var horizontal: CGFloat {
        self.leading + self.trailing
    }

    var vertical: CGFloat {
        self.top + self.bottom
    }
}
