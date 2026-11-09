import Foundation
import SwiftUI
import XCTest
import iOSSnapshotTestCase

@testable import GovKitExample
@testable import GovKit
@testable import GovKitUI

@MainActor
class GroupedListSnapshotTests: SnapshotTestCase {
    func test_defaultBackgroundColor_light_rendersCorrectly() {
        let groupedList = GroupedList(content: [testSection])

        VerifySnapshotInNavigationController(view: groupedList, mode: .light)
    }

    func test_defaultBackgroundColor_dark_rendersCorrectly() {
        let groupedList = GroupedList(content: [testSection])

        VerifySnapshotInNavigationController(view: groupedList, mode: .dark)
    }

    func test_overriddenBackgroundColor_light_rendersCorrectly() {
        let groupedList = GroupedList(content: [testSection], sectionBackgroundColor: .lightGray)
        VerifySnapshotInNavigationController(view: groupedList, mode: .light)
    }

    func test_overriddenBackgroundColor_dark_rendersCorrectly() {
        let groupedList = GroupedList(content: [testSection], sectionBackgroundColor: .darkGray)
        VerifySnapshotInNavigationController(view: groupedList, mode: .dark)
    }

    func test_selectableRowWithoutTrailingIcon_light_rendersCorrectly() {
        let groupedList = GroupedList(content: [selectableRowsSection])
        VerifySnapshotInNavigationController(view: groupedList, mode: .light)
    }

    func test_selectableRowWithoutTrailingIcon_dark_rendersCorrectly() {
        let groupedList = GroupedList(content: [selectableRowsSection])
        VerifySnapshotInNavigationController(view: groupedList, mode: .dark)
    }

    private var testSection: GroupedListSection = {
        GroupedListSection(
            heading: .init(title: "Section 1 header"),
            rows: [
                NavigationRow(id: "1", title: "Row title 1", body: "Body text", action: {}),
                LinkRow(id: "2", title: "Row title 2", action: {}),
                InformationRow(id: "3", title: "Row title 3", body: "Body text", detail: "Detail"),
                ToggleRow(id: "4", title: "Row title 4", isOn: true, action: {_ in }),
                DetailRow(id: "5", title: "Row title 5", body: "Body text", accessibilityHint: "", action: {}),
                CountRow(id: "6", title: "Row title 6",
                         state: .idle(showIndicator: true, count: 1), action: {}),
                SelectableRow(id: "7", title: "Row title 7", action: {})
            ],
            footer: "Footer"
        )
    }()

    private var selectableRowsSection: GroupedListSection = {
        GroupedListSection(
            heading: .init(title: "Selectable Rows"),
            rows: [
                SelectableRow(id: "1", title: "Selectable without icon", action: {}),
                SelectableRow(id: "2", title: "Selectable with icon", trailingIconName: "ellipsis", action: {})
            ],
            footer: "Selectable rows with and without trailing icons"
        )
    }()
}
