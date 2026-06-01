import Foundation
import UIKit
import Testing

@testable import GovKitUI

@Suite
@MainActor
struct GOVUKButtonTests {
    let sut: GOVUKButton
    let configuration: GOVUKButton.ButtonConfiguration

    init() {
        self.configuration = GOVUKButton.ButtonConfiguration.secondary
        self.sut = GOVUKButton(configuration)
    }

    @Test
    func init_withConfig_noTitle_returnsExpectedResult() {
        sut.updateConfiguration()
        sut.layoutIfNeeded()
        #expect(sut.configuration?.background.backgroundColor == configuration.backgroundColorNormal)
        #expect(sut.attributedTitle(for: .normal) == nil)
    }

    @Test
    func setTitleText_setsTitle() {
        sut.setTitle("test button", for: .normal)
        sut.updateConfiguration()
        sut.layoutIfNeeded()
        #expect(sut.configuration?.title == "test button")
    }

    @Test
    func setBackgroundColor_setsColor() {
        sut.backgroundColor = nil
        #expect(sut.backgroundColor == nil)

        sut.backgroundColor = .cyan
        #expect(sut.backgroundColor == .cyan)

        sut.backgroundColor = .clear
        #expect(sut.backgroundColor != nil)
    }

    @Test
    func setViewModel_changesViewModel() {
        let expectedViewModel = GOVUKButton.ButtonViewModel(
            localisedTitle: "new title",
            action: {
                // empty action
            }
        )

        sut.viewModel = expectedViewModel

        #expect(sut.viewModel?.localisedTitle == expectedViewModel.localisedTitle)
        #expect(sut.configuration?.title == expectedViewModel.localisedTitle)
    }

    @Test
    func setButtonConfiguration_changesConfig() {
        let expectedConfig = GOVUKButton.ButtonConfiguration.primary
        sut.buttonConfiguration = expectedConfig
        sut.setNeedsUpdateConfiguration()
        sut.layoutIfNeeded()
        #expect(sut.buttonConfiguration.titleColorNormal == expectedConfig.titleColorNormal)
        #expect(sut.buttonConfiguration.backgroundColorNormal == expectedConfig.backgroundColorNormal)
        #expect(sut.configuration?.background.backgroundColor == expectedConfig.backgroundColorNormal)
    }
}
