import Foundation
import UIKit
import Testing

@testable import GovKit

@Suite
@MainActor
struct ConstantsTests {
    @Test
    func govukBaseUrl_returnsExpectedResult() {
        #expect(Constants.API.govukBaseUrl.absoluteString == "https://www.gov.uk")
    }

    @Test
    func appStoreAppUrl_returnsExpectedResult() {
        #expect(Constants.API.appStoreAppUrl.absoluteString == "https://itunes.apple.com/v1/app/6572293285")
    }

    @Test
    func testFlightAppUrl_returnsExpectedResult() {
        #expect(Constants.API.testFlightAppUrl.absoluteString == "https://beta.itunes.apple.com/v1/app/6572293285")
    }

    @Test
    func helpAndFeedbackUrl_returnsExpectedResult() {
        #expect(Constants.API.helpAndFeedbackUrl.absoluteString == "https://www.gov.uk/contact/govuk-app")
    }

    @Test
    func reportProblemUrl_returnsExpectedResult() {
        #expect(Constants.API.reportProblemUrl.absoluteString == "https://www.gov.uk/contact/govuk-app/report-problem")
    }

    @Test
    func termsAndConditionsUrl_returnsExpectedResult() {
        #expect(Constants.API.termsAndConditionsUrl.absoluteString == "https://www.gov.uk/government/publications/govuk-app-terms-and-conditions")
    }

    @Test
    func accessibilityStatementUrl_returnsExpectedResult() {
        #expect(Constants.API.accessibilityStatementUrl.absoluteString == "https://www.gov.uk/government/publications/accessibility-statement-for-the-govuk-app")
    }

    @Test
    func privacyPolicyUrl_returnsExpectedResult() {
        #expect(Constants.API.privacyPolicyUrl.absoluteString == "https://www.gov.uk/government/publications/govuk-test-app-privacy-notice/govuk-test-app-privacy-notice")
    }
}
