import XCTest

@testable import GovKitUI

final class SwiftUIButtonTests: XCTestCase {
    var sut: SwiftUIButton!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}

@MainActor
extension SwiftUIButtonTests {

    func test_init_config_viewModel_createsButton() {
        XCTAssertNil(sut)
        let viewModel = GOVUKButton.ButtonViewModel(
            localisedTitle: "title",
            action: {
                    // no action
            }
        )
        sut = SwiftUIButton(.primary, viewModel: viewModel)

        XCTAssertNotNil(sut)
        let reflection = Mirror(reflecting: sut.body)

        let wrapped = reflection.children.first(where: { label, value in
            value is GovKitUI.SwiftUIWrappedButton
        })

        let wrappedButton = try? XCTUnwrap(wrapped?.value as? SwiftUIWrappedButton)

        XCTAssertNotNil(wrappedButton)
    }
}
