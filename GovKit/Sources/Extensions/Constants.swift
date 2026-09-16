import Foundation

public struct Constants {
    public struct API {
        public static let govukUrlHost = "www.gov.uk"
        public static let govukUrlScheme = "https"
        public static let govukBaseComponents: URLComponents = {
            var components = URLComponents()
            components.host = govukUrlHost
            components.scheme = govukUrlScheme
            return components
        }()
        public static let govukBaseUrl: URL = govukBaseComponents.url!

        public static let appStoreAppUrl = URL(
            string: "https://itunes.apple.com/v1/app/6572293285"
        )!
        public static let testFlightAppUrl = URL(
            string: "https://beta.itunes.apple.com/v1/app/6572293285"
        )!

        public static let helpAndFeedbackUrl: URL = {
            var components = govukBaseComponents
            components.path = "/contact/govuk-app"
            return components.url!
        }()

        public static let reportProblemUrl: URL = {
            var components = govukBaseComponents
            components.path = "/contact/govuk-app/report-problem"
            return components.url!
        }()

        public static let termsAndConditionsUrl: URL = {
            var components = govukBaseComponents
            components.path = "/government/publications/govuk-app-terms-and-conditions"
            return components.url!
        }()

        public static let accessibilityStatementUrl: URL = {
            var components = govukBaseComponents
            components.path = """
            /government/publications/accessibility-statement-for-the-govuk-app
            """
            return components.url!
        }()

        public static let privacyPolicyUrl: URL = {
            var components = govukBaseComponents
            components.path = """
            /government/publications/govuk-test-app-privacy-notice/govuk-test-app-privacy-notice
            """
            return components.url!
        }()

        public static let authenticationCallbackUri: String = "govuk://govuk/login-auth-callback"
    }

    public struct SigningKey {
        public static let govUK = "integration_pubkey"
    }
}
