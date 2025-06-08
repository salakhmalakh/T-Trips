import UIKit

final class SettingsViewController: UIViewController {
    private let settingsView = SettingsView()

    override func loadView() { view = settingsView }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
    }
}
