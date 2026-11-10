import Foundation
import Testing

@testable import GovKit

@Suite
struct AppErrorViewModelTests {

    @Test
    func init_defaults_valuesAreNil() {
        let sut = AppErrorViewModel()
        #expect(sut.title == nil)
        #expect(sut.body == nil)
        #expect(sut.buttonTitle == nil)
        #expect(sut.buttonAccessibilityLabel == nil)
        #expect(sut.isWebLink == false)
        #expect(sut.errorType == .generic)
        #expect(sut.action == nil)
    }

    // MARK: - Custom init

    @Test
    func init_withTitle_storesTitle() {
        let sut = AppErrorViewModel(title: "Test Title")
        #expect(sut.title == "Test Title")
    }

    @Test
    func init_withBody_storesBody() {
        let sut = AppErrorViewModel(body: "Test body text")
        #expect(sut.body == "Test body text")
    }

    @Test
    func init_withButtonTitle_storesButtonTitle() {
        let sut = AppErrorViewModel(buttonTitle: "Retry")
        #expect(sut.buttonTitle == "Retry")
    }

    @Test
    func init_withButtonAccessibilityLabel_storesLabel() {
        let sut = AppErrorViewModel(buttonAccessibilityLabel: "Retry action")
        #expect(sut.buttonAccessibilityLabel == "Retry action")
    }

    @Test
    func init_withIsWebLinkTrue_storesIsWebLink() {
        let sut = AppErrorViewModel(isWebLink: true)
        #expect(sut.isWebLink == true)
    }

    @Test
    func init_withNetworkErrorType_storesErrorType() {
        let sut = AppErrorViewModel(errorType: .network)
        #expect(sut.errorType == .network)
    }

    @Test
    func init_withAction_actionIsNotNil() {
        let sut = AppErrorViewModel(action: {})
        #expect(sut.action != nil)
    }

    // MARK: - networkUnavailable factory

    @Test
    func networkUnavailable_setsNetworkErrorType() {
        let sut = AppErrorViewModel.networkUnavailable(action: {})
        #expect(sut.errorType == .network)
    }

    @Test
    func networkUnavailable_setsExpectedTitle() {
        let sut = AppErrorViewModel.networkUnavailable(action: {})
        #expect(sut.title == String.common.localized("networkUnavailableErrorTitle"))
    }

    @Test
    func networkUnavailable_setsExpectedBody() {
        let sut = AppErrorViewModel.networkUnavailable(action: {})
        #expect(sut.body == String.common.localized("networkUnavailableErrorBody"))
    }

    @Test
    func networkUnavailable_setsExpectedButtonTitle() {
        let sut = AppErrorViewModel.networkUnavailable(action: {})
        #expect(sut.buttonTitle == String.common.localized("networkUnavailableButtonTitle"))
    }

    @Test
    func networkUnavailable_isWebLinkIsFalse() {
        let sut = AppErrorViewModel.networkUnavailable(action: {})
        #expect(sut.isWebLink == false)
    }

    @Test
    func networkUnavailable_buttonAccessibilityLabelIsNil() {
        let sut = AppErrorViewModel.networkUnavailable(action: {})
        #expect(sut.buttonAccessibilityLabel == nil)
    }

    @Test
    func networkUnavailable_action_firesWhenCalled() {
        var actionFired = false
        let sut = AppErrorViewModel.networkUnavailable(action: { actionFired = true })
        sut.action?()
        #expect(actionFired == true)
    }

    // MARK: - genericError factory

    @Test
    func genericError_setsGenericErrorType() {
        let sut = AppErrorViewModel.genericError(urlOpener: MockURLOpener())
        #expect(sut.errorType == .generic)
    }

    @Test
    func genericError_setsExpectedTitle() {
        let sut = AppErrorViewModel.genericError(urlOpener: MockURLOpener())
        #expect(sut.title == String.common.localized("genericErrorTitle"))
    }

    @Test
    func genericError_setsExpectedBody() {
        let sut = AppErrorViewModel.genericError(urlOpener: MockURLOpener())
        #expect(sut.body == String.common.localized("genericErrorBody"))
    }

    @Test
    func genericError_setsExpectedButtonTitle() {
        let sut = AppErrorViewModel.genericError(urlOpener: MockURLOpener())
        #expect(sut.buttonTitle == String.common.localized("genericErrorButtonTitle"))
    }

    @Test
    func genericError_setsExpectedButtonAccessibilityLabel() {
        let sut = AppErrorViewModel.genericError(urlOpener: MockURLOpener())
        #expect(sut.buttonAccessibilityLabel == String.common.localized("genericErrorButtonTitleAccessibilityLabel"))
    }

    @Test
    func genericError_isWebLinkIsTrue() {
        let sut = AppErrorViewModel.genericError(urlOpener: MockURLOpener())
        #expect(sut.isWebLink == true)
    }

    @Test
    func genericError_action_opensGovUKUrl() {
        let mockURLOpener = MockURLOpener()
        let sut = AppErrorViewModel.genericError(urlOpener: mockURLOpener)
        sut.action?()
        #expect(mockURLOpener.openedURL == Constants.API.govukBaseUrl)
    }
}

private final class MockURLOpener: URLOpener {
    private(set) var openedURL: URL?

    func openIfPossible(_ url: URL) -> Bool {
        openedURL = url
        return true
    }

    func openIfPossible(_ urlString: String) -> Bool { false }
    func canOpenURL(_ url: URL) -> Bool { true }
}
