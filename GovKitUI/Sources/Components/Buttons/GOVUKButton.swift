import UIKit

final public class GOVUKButton: UIButton {
    public var buttonConfiguration: ButtonConfiguration {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }

    public var viewModel: ButtonViewModel? {
        didSet {
            viewModelUpdate()
        }
    }

    public init(_ configuration: ButtonConfiguration,
                viewModel: ButtonViewModel? = nil) {
        self.viewModel = viewModel
        self.buttonConfiguration = configuration
        super.init(frame: .zero)
        self.configuration = UIButton.Configuration.plain()
        initialisation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(
            UIAccessibility.buttonShapesEnabledStatusDidChangeNotification
        )
    }

    private func initialisation() {
        titleLabel?.adjustsFontForContentSizeCategory = true
        viewModelUpdate()
        configureShadow()
        configureButtonShapesStyle()
        registerNotifications()
    }

    public override func didUpdateFocus(in context: UIFocusUpdateContext,
                                        with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        configureBackgroundColor()
        configureShadow()
    }

    private func addNewAction(_ action: @escaping () -> Void) {
        let action = UIAction(
            handler: { _ in
                action()
            }
        )
        addAction(action, for: .touchUpInside)
    }

    override public var isHighlighted: Bool {
        didSet {
            configureBackgroundColor()
            configureBorderColor()
            configureShadow()
        }
    }

    public override var intrinsicContentSize: CGSize {
        let titlesize = titleLabel?.intrinsicContentSize ?? .zero
        let configInsets = configuration?.contentInsets ?? buttonConfiguration.contentEdgeInsets.directionalInsets
        return CGSize(
            width: titlesize.width + configInsets.horizontal,
            height: titlesize.height + configInsets.vertical
        )
    }

    private func registerNotifications() {
        NotificationCenter.default.addObserver(
            forName: UIAccessibility.buttonShapesEnabledStatusDidChangeNotification,
            object: nil,
            queue: nil,
            using: { [weak self] _ in
                self?.configureButtonShapesStyle()
           }
        )
    }

    public override func accessibilityElementDidLoseFocus() {
        super.accessibilityElementDidLoseFocus()
        let state: UIControl.State = self.isEnabled ? .normal : .disabled
        configureFonts(state: state)
        configureBackgroundColor(state: state)
        configureBorderColor(state: state)
        configureShadow(state: state)
    }

    public override func accessibilityElementDidBecomeFocused() {
        super.accessibilityElementDidBecomeFocused()
        configureFonts(state: .focused)
        configureBackgroundColor(state: .focused)
        configureBorderColor(state: .focused)
        configureShadow(state: .focused)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        guard let width = titleLabel?.frame.width else { return }
        titleLabel?.preferredMaxLayoutWidth = width

        updateConstraints()
    }

    public override var isEnabled: Bool {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }

    private func viewModelUpdate() {
        configuration?.title = viewModel?.localisedTitle
        accessibilityLabel = viewModel?.localisedAccessibilityLabel ?? viewModel?.localisedTitle
        removeAllActions()
        if let action = viewModel?.action {
            addNewAction(action)
        }
    }

    public override func updateConfiguration() {
        guard let configuration = configuration else { return }
        var updatedConfiguration = configuration

        updatedConfiguration.titleAlignment = buttonConfiguration.textAlignment.titleAlignment
        updatedConfiguration.titleLineBreakMode = .byWordWrapping
        updatedConfiguration.contentInsets = buttonConfiguration.contentEdgeInsets.directionalInsets
        updatedConfiguration.cornerStyle = .fixed
        updatedConfiguration.background.cornerRadius = buttonConfiguration.cornerRadius
        self.configuration = updatedConfiguration
        configureFonts()
        configureBackgroundColor()
        configureAlignment()
        configureBorderColor()
        configureShadow()
    }

    private func configureShadow(state: UIControl.State? = nil) {
        let localState = state ?? self.state
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = buttonConfiguration.shadowRadius
        switch localState {
        case .normal:
            layer.shadowOpacity = buttonConfiguration.shadowOpacity
            layer.shadowColor = buttonConfiguration.shadowColor
        case .highlighted:
            layer.shadowOpacity = buttonConfiguration.shadowOpacity
            layer.shadowColor = buttonConfiguration.shadowHighLightedColor
        case .focused:
            layer.shadowOpacity = buttonConfiguration.shadowOpacity
            layer.shadowColor = buttonConfiguration.shadowFocusedColor
        default:
            layer.shadowColor = UIColor.clear.cgColor
            layer.shadowOpacity = 0
            layer.shadowRadius = 0
        }
    }

    private func configureFonts(state: UIControl.State? = nil) {
        guard let configuration = configuration else { return }
        let localState = state ?? self.state
        var updatedConfiguration = configuration
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        updatedConfiguration.titleTextAttributesTransformer = .init { attributes in
            var container = attributes
            container.font = self.buttonConfiguration.titleFont
            let fontColor = self.configureFontColor(state: localState)
            container.foregroundColor = fontColor
            container.underlineColor = fontColor
            container.underlineStyle = UIAccessibility.buttonShapesEnabled ?
            NSUnderlineStyle.single : []
            container.paragraphStyle = paragraphStyle
            return container
        }
        self.configuration = updatedConfiguration
    }

    private func configureFontColor(state: UIControl.State? = nil) -> UIColor? {
        let localState = state ?? self.state
        return switch localState {
        case .normal:
            accessibilityElementIsFocused() ?
            buttonConfiguration.titleColorFocused :
            buttonConfiguration.titleColorNormal
        case .highlighted:
            buttonConfiguration.titleColorHighlighted
        case .focused:
            buttonConfiguration.titleColorFocused
        case .disabled:
            buttonConfiguration.titleColorDisabled
        default:
            buttonConfiguration.titleColorNormal
        }
    }

    private func configureBackgroundColor(state: UIControl.State? = nil) {
        guard let configuraton = configuration else { return }
        let localState = state ?? self.state
        var updateConfiguration = configuraton
        let color: UIColor
        if localState == .disabled {
            color = buttonConfiguration.backgroundColorDisabled
        } else if localState == .focused {
            color = buttonConfiguration.backgroundColorFocused
            configureShadow()
        } else {
            color = UIAccessibility.buttonShapesEnabled ?
            buttonConfiguration.accessibilityButtonShapesColor(for: localState) :
            buttonConfiguration.backgroundColor(for: localState)
        }

        updateConfiguration.background.backgroundColor = color
        self.configuration = updateConfiguration
    }

    private func configureAlignment() {
        contentHorizontalAlignment = buttonConfiguration.contentHorizontalAlignment
        contentVerticalAlignment = buttonConfiguration.contentVerticalAlignment
    }

    private func configureBorderColor(state: UIControl.State? = nil) {
        guard let configuration = configuration else { return }
        var updatedConfiguration = configuration
        updatedConfiguration.background.strokeWidth = 0.5
        let localState = state ?? self.state
        var borderColor: UIColor
        switch localState {
        case .normal:
            borderColor = buttonConfiguration.borderColorNormal
        case .highlighted:
            borderColor = buttonConfiguration.borderColorHighlighted
        default:
            borderColor = UIColor.clear
        }
        updatedConfiguration.background.strokeColor = borderColor
        self.configuration = updatedConfiguration
    }

    private func configureButtonShapesStyle() {
        guard buttonConfiguration.backgroundColorNormal == .clear,
              let configuration = configuration
        else { return }

        configureBackgroundColor()
        var updatedConfiguration = configuration
        if UIAccessibility.buttonShapesEnabled {
            if updatedConfiguration.contentInsets.leading < 4 {
                updatedConfiguration.contentInsets = .init(
                    top: 4,
                    leading: 4,
                    bottom: 4,
                    trailing: 4
                )
            }
        } else {
            updatedConfiguration.contentInsets = buttonConfiguration.contentEdgeInsets.directionalInsets
        }
        self.configuration = updatedConfiguration
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setNeedsUpdateConfiguration()
    }
}
