import SwiftUI

public struct GroupedList: View {
    var content: [GroupedListSection]
    var sectionBackgroundColor: UIColor?

    public init(content: [GroupedListSection],
                sectionBackgroundColor: UIColor? = nil) {
        self.content = content
        self.sectionBackgroundColor = sectionBackgroundColor
    }

    public var body: some View {
        if content.count >= 1 {
            VStack(spacing: 16) {
                ForEach(content, id: \.rows.first?.id) { section in
                    GroupedListSectionView(
                        section: section,
                        style: section.heading?.icon != nil ? .icon : .titled,
                        backgroundColor: sectionBackgroundColor
                    )
                }
            }
            .frame(idealWidth: UIScreen.main.bounds.width)
        }
    }
}

public struct GroupedList_Previews: PreviewProvider {
    public static var previews: some View {
        GroupedList(content: previewContent)
    }

    public static var previewContent: [GroupedListSection] {
        [
            .init(
                heading: GroupedListHeader(title: "Section 1",
                                           icon: nil,
                                           actionTitle: "See all",
                                           action: { print("tap") }),
                rows: [
                    InformationRow(
                        id: UUID().uuidString,
                        title: "Information row",
                        body: "Description",
                        detail: "0.0.1"
                    ),
                    LinkRow(
                        id: UUID().uuidString,
                        title: "Link row",
                        body: "A really long description to test how multiline text wrapping works",
                        action: {
                            print("link row tapped")
                        }
                    ),
                    LinkRow(
                        id: UUID().uuidString,
                        title: "Link row with leading icon",
                        body: nil,
                        imageName: "step_by_step",
                        showLinkImage: false,
                        action: {
                            print("link row tapped")
                        }
                    ),
                    NavigationRow(
                        id: UUID().uuidString,
                        title: "Nav row",
                        body: "Description",
                        action: {
                            print("nav row tapped")
                        }
                    ),
                    ToggleRow(
                        id: UUID().uuidString,
                        title: "Toggle",
                        isOn: false,
                        action: { isOn in
                            print("Toggled: \(isOn)")
                        }
                    ),
                    CountRow(
                        id: UUID().uuidString,
                        title: "Count",
                        state: .idle(showIndicator: true, count: 42),
                        action: {
                            print("Count row tapped")
                        }
                    ),
                    CountRow(
                        id: UUID().uuidString,
                        title: "Count loading",
                        state: .loading,
                        action: {
                            print("Count row tapped")
                        }
                    )
                ],
                footer: "some really important text about this section that is long enough to wrap"
            ),
            .init(
                heading: nil,
                rows: [
                    InformationRow(
                        id: UUID().uuidString,
                        title: "Information row",
                        body: "Description",
                        detail: "1.0"
                    ),
                    LinkRow(
                        id: UUID().uuidString,
                        title: "External link row",
                        body: nil,
                        action: {
                            print("link row tapped")
                        }
                    ),
                    NavigationRow(
                        id: UUID().uuidString,
                        title: "Navigation row",
                        body: "Description",
                        action: {
                            print("nav row tapped")
                        }
                    )
                ],
                footer: nil
            ),
            .init(
                heading: GroupedListHeader(
                    title: "Section 2",
                    icon: UIImage(systemName: "house")
                ),
                rows: [
                    InformationRow(
                        id: UUID().uuidString,
                        title: "A really important piece of info",
                        body: nil,
                        detail: "1.0"
                    )
                ],
                footer: "some really important text about this section"
            )
        ]
    }
}

