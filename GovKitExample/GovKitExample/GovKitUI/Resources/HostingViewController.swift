import SwiftUI
import GovKitUI

protocol HostableView: View {
    associatedtype ViewModel
    init(viewModel: ViewModel)
}

extension SwiftUIComponentsScreen: HostableView { }

final class HostingViewController<HostedView: HostableView>: UIViewController {
    let viewModel: HostedView.ViewModel
    let hideNavbar: Bool?

    init(viewModel: HostedView.ViewModel, showNavbar: Bool? = nil) {
        self.viewModel = viewModel
        self.hideNavbar = showNavbar
        applyNavBarTint()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func applyNavBarTint(){
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.tintColor = .accentGreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let hostedView = HostedView(viewModel: viewModel)
        let controller = UIHostingController(rootView: hostedView)
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        setNavBar(hideNavbar ?? false, animated: false)
        view.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setNavBar(_ isHidden: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: animated)
    }
}
