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

#Preview {
    GroupedList(content: GroupedListPreviewFixtures.previewContent)
}
