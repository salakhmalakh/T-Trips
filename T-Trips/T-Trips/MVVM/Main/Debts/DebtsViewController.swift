import UIKit
import Combine

final class DebtsViewController: UIViewController {
    private let debtsView = DebtsView()
    private let viewModel: DebtsViewModel
    private var cancellables = Set<AnyCancellable>()

    init(tripId: Int64) {
        self.viewModel = DebtsViewModel(tripId: tripId)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() { view = debtsView }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Долги"
        debtsView.tableView.dataSource = self
    }
}

extension DebtsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.debts.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.reuseId, for: indexPath) as! CustomTableCell
        let debt = viewModel.debts[indexPath.row]
        let from = MockData.users.first { $0.id == debt.fromUserId }
        cell.textLabel?.text = "\(from?.firstName ?? "") \(from?.lastName ?? "")"
        cell.detailTextLabel?.text = String(format: "%.2f ₽", debt.amount)
        return cell
    }
}
