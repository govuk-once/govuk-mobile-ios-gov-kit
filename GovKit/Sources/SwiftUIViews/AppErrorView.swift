import SwiftUI

public struct AppErrorView: View {
    public var viewModel: AppErrorViewModel?

    public init(viewModel: AppErrorViewModel? = nil) {
        self.viewModel = viewModel
    }

    public var body: some View {
            VStack(spacing: 8) {
                warningImage
                errorTitle
                errorBody
                actionButton
            }
            .padding(.vertical, 16)
    }

    private var warningImage: some View {
        let imageName = viewModel?.errorType == .network ? "wifi.slash" : "exclamationmark.circle"
        return Image(systemName: imageName)
            .resizable()
            .frame(width: 31, height: 31)
            .foregroundColor(Color(uiColor: .govUK.text.trailingIcon))
            .fontWeight(.bold)
            .accessibilityHidden(true)
    }

    private var errorTitle: some View {
        Text(viewModel?.title ?? "")
            .font(.govUK.bodySemibold)
            .multilineTextAlignment(.center)
    }

    private var errorBody: some View {
        Text(viewModel?.body ?? "")
            .multilineTextAlignment(.center)
            .padding(.bottom, 16)
            .padding(.horizontal, 20)
    }

    private var actionButton: some View {
        Button(viewModel?.buttonTitle ?? "") {
            viewModel?.action?()
        }
        .foregroundColor(Color(UIColor.govUK.text.buttonSecondary))
        .padding(.vertical, 13)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.govUK.fills.surfaceButtonSecondary))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(UIColor.govUK.strokes.buttonSecondaryDefault), lineWidth: 1))
        .font(.govUK.body)
        .padding(.horizontal, 20)
        .accessibilityLabel(
            Text(viewModel?.buttonAccessibilityLabel
                 ?? viewModel?.buttonTitle
                 ?? "")
            )
        .accessibilityRemoveTraits(.isButton)
        .accessibilityAddTraits(
            (viewModel?.isWebLink ?? false)
            ? .isLink
            : .isButton
        )
        .accessibilityHint(
            (viewModel?.isWebLink ?? false)
            ? String.common.localized("openWebLinkHint")
            : ""
        )
        .opacity(viewModel?.buttonTitle == nil ? 0 : 1)
    }
}
