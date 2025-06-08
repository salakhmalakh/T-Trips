import UIKit
import Combine

final class NotificationsViewController: UIViewController {
    private let notificationsView = NotificationsView()
    private let viewModel = NotificationsViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func loadView() { view = notificationsView }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Уведомления"
        notificationsView.tableView.dataSource = self
    }
}

extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.notifications.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.reuseId, for: indexPath) as! CustomTableCell
        let n = viewModel.notifications[indexPath.row]
        cell.textLabel?.text = n.message
        return cell
    }
}
