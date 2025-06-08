import UIKit

final class StartViewController: UIViewController {
    private let startView = StartView()

    override func loadView() {
        view = startView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let authVC = AuthViewController()
            let nav = UINavigationController(rootViewController: authVC)
            nav.navigationBar.prefersLargeTitles = true
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = nav
            }
        }
    }
}
