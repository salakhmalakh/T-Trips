import UIKit
import Combine

final class DebtDetailViewController: UIViewController {
    private let detailView = DebtDetailView()
    private let viewModel: DebtDetailViewModel
    private var cancellables = Set<AnyCancellable>()

    init(debt: Debt) {
        self.viewModel = DebtDetailViewModel(debt: debt)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() { view = detailView }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Детали"
        bind()
        detailView.confirmButton.addAction(UIAction { [weak self] _ in self?.viewModel.onConfirm?() }, for: .touchUpInside)
    }

    private func bind() {
        viewModel.$info
            .receive(on: RunLoop.main)
            .assign(to: \ .text, on: detailView.infoLabel)
            .store(in: &cancellables)
    }
}
