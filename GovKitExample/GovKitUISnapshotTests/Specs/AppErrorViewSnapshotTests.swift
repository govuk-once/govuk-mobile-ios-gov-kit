import Foundation
import SwiftUI
import XCTest

@testable import GovKit

@MainActor
class AppErrorViewSnapshotTests: SnapshotTestCase {

    func test_networkError_withButton_lightMode_rendersCorrectly() {
        let view = AppErrorView(viewModel: .networkUnavailable(action: {}))
        VerifySnapshotInNavigationController(view: view, mode: .light, navBarHidden: true)
    }

    func test_networkError_withButton_darkMode_rendersCorrectly() {
        let view = AppErrorView(viewModel: .networkUnavailable(action: {}))
        VerifySnapshotInNavigationController(view: view, mode: .dark, navBarHidden: true)
    }

    func test_networkError_withoutButton_lightMode_rendersCorrectly() {
        let view = AppErrorView(viewModel: AppErrorViewModel(
            title: "You are not connected to the internet",
            body: "You need to have an internet connection to use the GOV.UK app. \n\nReconnect to the internet and try again.",
            buttonTitle: nil,
            errorType: .network
        ))
        VerifySnapshotInNavigationController(view: view, mode: .light, navBarHidden: true)
    }

    func test_networkError_withoutButton_darkMode_rendersCorrectly() {
        let view = AppErrorView(viewModel: AppErrorViewModel(
            title: "You are not connected to the internet",
            body: "You need to have an internet connection to use the GOV.UK app. \n\nReconnect to the internet and try again.",
            buttonTitle: nil,
            errorType: .network
        ))
        VerifySnapshotInNavigationController(view: view, mode: .dark, navBarHidden: true)
    }

    func test_genericError_withButton_lightMode_rendersCorrectly() {
        let view = AppErrorView(viewModel: .genericError(urlOpener: NoOpURLOpener()))
        VerifySnapshotInNavigationController(view: view, mode: .light, navBarHidden: true)
    }

    func test_genericError_withButton_darkMode_rendersCorrectly() {
        let view = AppErrorView(viewModel: .genericError(urlOpener: NoOpURLOpener()))
        VerifySnapshotInNavigationController(view: view, mode: .dark, navBarHidden: true)
    }

    func test_noViewModel_lightMode_rendersCorrectly() {
        let view = AppErrorView()
        VerifySnapshotInNavigationController(view: view, mode: .light, navBarHidden: true)
    }
}

private struct NoOpURLOpener: URLOpener {
    func openIfPossible(_ url: URL) -> Bool { false }
    func openIfPossible(_ urlString: String) -> Bool { false }
    func canOpenURL(_ url: URL) -> Bool { false }
}
