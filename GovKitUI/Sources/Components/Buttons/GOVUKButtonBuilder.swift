import Foundation

@MainActor
public struct GOVUKButtonBuilder {
    public var primary: GOVUKButton {
        GOVUKButton(.primary)
    }

    public var secondary: GOVUKButton {
        GOVUKButton(.secondary)
    }

    public var groupedSecondary: GOVUKButton {
        GOVUKButton(.groupedSecondary)
    }

    public var compact: GOVUKButton {
        GOVUKButton(.compact)
    }
}
